
import YAML from 'yaml'
import fs from 'fs'
import path from 'path'
const chalk = require('chalk')

/*
 * parsing yaml to json, add className and classPath from $ref prop.
 */
function getSchema(filePath:string) {

	const getClassName = (filePath: string) => {
		return filePath.split('/')[filePath.split('/').length - 1]
		.replace('.schema.yaml', '')
		.split('-')
		.reduce((className:string, word:string) => {
			className += word[0].toUpperCase() + word.substr(1)
			return className
		}, '')
	}

	const schemaDirPath = path.dirname(filePath)
	const schema = YAML.parse(fs.readFileSync(filePath, 'utf-8'))
	schema['className'] = getClassName(filePath)
	schema['classPath'] = schemaDirPath

	const refToAbs = (obj:any) => {
		Object.keys(obj).forEach((propName:string) => {
			if (typeof obj[propName] == 'object') {
				refToAbs(obj[propName])
			}

			if (propName == '$ref') {
				const absPath = path.join(schemaDirPath, obj[propName])
				const dirPath = path.dirname(absPath)
				let className = getClassName(absPath)
														
				obj['className'] = className
				obj['classPath'] = dirPath
			}
		})
	}

	refToAbs(schema)

	return schema
}

/*
 * get redefined schemas from dir path.
 */
function getSchemas(schemaPath:string) {
	const schemas:any = []

	const getSchemas_ = (schemaPath:string) => {
		if (fs.lstatSync(schemaPath).isDirectory()) {
			fs.readdirSync(schemaPath).forEach((subPath: string) => {
				subPath = path.join(schemaPath, subPath)
				getSchemas_(subPath)
			})
		} else if (schemaPath.endsWith('.yaml')){
			schemas.push(getSchema(schemaPath))
		}
	}

	getSchemas_(schemaPath)

	return schemas
}


function _generateClassCode(schema: any) {
	const className = schema['className']
	const schemaDirPath = schema['classPath']
	const properties = schema['properties']
	let importCodes = ''
	let definePropsCodes = ''
	let extendsCode = ''

	definePropsCodes = Object.keys(properties).reduce((dartCode: string, propName: string) => {
		const prop = properties[propName]
		let type = ''
		let propValue = ''

		if (prop.hasOwnProperty('const')) {
			type = 'String'
			propValue = ' = "' + prop['const'] + '"'
		} else if (prop.hasOwnProperty('type')) {
			switch (prop['type']) {
				case 'integer':
					type = 'int'
				break
				case 'boolean':
					type = 'bool'
				break
				case 'number':
					type = 'double'
				break
				case 'string':
					type = 'String'
				break
				case 'array':
					type = 'List'
				break										
			}
		} else if (prop.hasOwnProperty('$ref')) {
			type = prop['className']
			const classPath = prop['classPath']
			console.log(schema)
		} else {
			console.log(chalk.red('----------- unknown property type \n' + JSON.stringify(prop, null, 2))+'\n\n')
		}


		dartCode += '  ' + type + ' ' + propName + propValue + ';\n'
		return dartCode
	}, '')

	return importCodes + '\n'
				+ 'class ' + className + extendsCode + ' {\n'
			 + definePropsCodes + '\n'
			 + '}'
}

function _generateEnumCode(schema: any) {
	const className = schema['className']
	
	const definePropsCodes = schema['enumDescriptions'].map((enumName:string) => {
		return enumName.split(' ').reduce((en:string, word:string) => {
			en += word[0].toUpperCase() + word.substr(1)		
			return en
		}, '')
	}).join(',\n  ')

	return 'enum ' + className + ' {\n'
			 + '  '+ definePropsCodes + '\n'
			 + '}'
}

function generateDartCode(schema: any) {
	if (schema.hasOwnProperty('properties')) {
		return _generateClassCode(schema)
	} else if (schema.hasOwnProperty('enum')) {
		return _generateEnumCode(schema)
	} else {
		console.log(schema)
	}
}


const SCHEMA_PATH = 'schema'
const schemas = getSchemas(SCHEMA_PATH)
const schema = schemas[50]

const dartCode = generateDartCode(schema)
console.log(dartCode)



/*
const
$ref
type
minimum
items
allOf
description
maximum
additionalProperties
propertyNames
patternProperties
enum
properties
exclusiveMinimum
enumDescriptions
oneOf
optional
minItems
*/
