
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
				let classType = YAML.parse(fs.readFileSync('./'+absPath, 'utf-8')).type

				switch (classType) {
					case 'integer':
						classType = 'int'
						break
					case 'number':
						classType = 'double'
						break						
					case 'boolean':
						classType = 'bool'
						break													
					case 'string':
						classType = 'String'
						break
					default:
						classType = 'String'
						break
				}

				obj['classType'] = classType
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
	const allOf = schema['allOf']
	let properties = schema['properties']
	let importCodes = ''
	let definePropsCodes = ''
	let extendsCode = ''
	let subClassCode = ''

	if (allOf) {
		const importCode = "import '"+path.dirname(allOf[0]['$ref']) + '/' + allOf[0]['className'] + ".dart';\n"
		importCodes += importCode
		properties = allOf[1]['properties']
		extendsCode = ' extends ' + allOf[0]['className']
	}	

	if (!properties) properties = {}

	definePropsCodes = Object.keys(properties).reduce((dartCode: string, propName: string) => {
		const prop = properties[propName]
		let type = ''
		let propValue = ''

		if (prop.hasOwnProperty('const')) {
			type = 'final String'
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
				case 'object':
					prop['className'] = className + '_' + (propName[0].toUpperCase() + propName.substr(1))
					
					if (prop.hasOwnProperty('properties')) {
						type = prop['className']
					} else {
						type = 'dynamic'
					}

					subClassCode = _generateClassCode(prop)
				break
			}
		} else if (prop.hasOwnProperty('$ref')) {
			const classType = prop['classType']
			if (classType == 'object') {
				type = prop['className']
				const importCode = "import '"+path.dirname(prop['$ref']) + '/' + type + ".dart';\n"
				importCodes += importCode
			} else {
				type = classType
				if (type == undefined) {
					console.log(prop)
				}
			}

		} else if (prop.hasOwnProperty('allOf')) {
			prop['className'] = className + '_' + prop['allOf'][0]['className']
			type = prop['className']
			subClassCode = _generateClassCode(prop)				
		} else if (prop.hasOwnProperty('oneOf')) {
			type = 'dynamic'
		} 
		else {
			console.log(chalk.red('----------- unknown property "'+ propName + '" in ' + className + '\n' + JSON.stringify(prop, null, 2))+'\n\n')
		}
  
		dartCode += '  ' + type + ' ' + propName + propValue + ';\n'
		return dartCode
	}, '')

	return importCodes + '\n'
				+ 'class ' + className + extendsCode + ' {\n'
			 + definePropsCodes + '\n'
			 + '} \n ' + subClassCode
}

function _generateEnumCode(schema: any) {
	const className = schema['className']
	let definePropsCodes = ''

	const enums = schema.hasOwnProperty('enumDescriptions') ? schema['enumDescriptions'] : schema['enum']

	definePropsCodes = enums.map((enumName:string) => {
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
	const type = schema['type']
	const className = schema['className']

	switch (type) {
		case 'string':
		case 'number':
		case 'integer':
			if (schema.hasOwnProperty('enum')) {
				return _generateEnumCode(schema)
			} else {
				// console.log(chalk.red('----------- unknown integer or string type "'+ className + '"\n' + JSON.stringify(schema, null, 2))+'\n\n')
			}
			break
		case 'object':
			return _generateClassCode(schema)
		default:
			if (schema['allOf']) {
				return _generateClassCode(schema)
			} else if (schema['oneOf']){

			} else {
				console.log(chalk.red('----------- unknown type "'+ className + '"\n' + JSON.stringify(schema, null, 2))+'\n\n')		

			}
	}

	return 'class Empty { }'
}


const SCHEMA_PATH = 'schema'
const DIST_PATH = 'dist'
const schemas = getSchemas(SCHEMA_PATH)
const schema = schemas[0]

schemas.forEach((schema:any) => {
	const className = schema['className']
	const classPath = path.join(DIST_PATH, schema['classPath'])

	if (!fs.existsSync(classPath)) {
		fs.mkdirSync(classPath)
	}

	const dartPath = path.join(classPath, className + '.dart')
	const dartCode = generateDartCode(schema)
	fs.writeFileSync(dartPath, dartCode)	
})


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
