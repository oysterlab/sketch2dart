import YAML from 'yaml'
import fs from 'fs'
import path from 'path'

function getRootPath(filename: string): string {
	let rootPath = path.resolve(filename)
	rootPath = rootPath.substring(0, rootPath.lastIndexOf("/"))		
	return rootPath
}

const getTypeMap = function(filename: string): Map<string, any> {
	let rootPath = getRootPath(filename)
	let typeMap:Map<string, any> = new Map<string, string>()
	filename = filename.split('/')[filename.split('/').length - 1]

	const _getObjectItem = function(filepath: string, data: any) {

		Object.keys(data).forEach(function(key) {
			const isObject = (typeof data[key] == 'object')
			if (isObject) {
				_getObjectItem(filepath, data[key])
			}

			if (key == 'type' 
						&& !typeMap.has(data[key])) {
				const skTypeName = data[key]
				let dartTypeName = ''

				switch(skTypeName) {
					case 'string':
						dartTypeName = 'String'
					break
					case 'array':
						dartTypeName = 'List'
					break
					case 'number':
						dartTypeName = 'double'
					break
					case 'integer':
						dartTypeName = 'int'
					break
					case 'boolean':
						dartTypeName = 'bool'						
					break
					case 'object':
						dartTypeName = "Map<String, dynamic>"
					break															
				}
				
				if (dartTypeName.length > 0) {
					typeMap.set(skTypeName, {
						data: null,						
						typeName: dartTypeName,
						isDone: false
					})
				}
			}

			if (key == '$ref') {
				console.log
				let refPath:string = data[key]
				
				const pathToken = refPath.split('/')
				const fileName = pathToken[pathToken.length - 1]
				const dirName = pathToken[pathToken.length - 2]
				switch(dirName) {
					case 'enums':
					case 'layers':
					case 'objects':						
					case 'utils':
						refPath = path.resolve(rootPath, dirName, fileName)
					break

					default:
						refPath = path.resolve(filepath + '/../', refPath)
					break
				}

				const relativePath = refPath.replace(rootPath, '')
				if(!typeMap.has(relativePath)) {
					let className = fileName
							.replace('.schema.yaml', '')
							.replace(/-([a-z])/g, (g) => g[1].toUpperCase())
						className = className.charAt(0).toUpperCase() + className.slice(1)

					typeMap.set(relativePath, {
						schema: YAML.parse(fs.readFileSync(refPath, 'utf8')),
						typeName: className,
						isDone: false,
					})
					_getTypeMap(refPath)
				}
			}
		})		
	}

	const _getTypeMap = function(filepath: string) {
		const file = fs.readFileSync(filepath, 'utf8')
		const result = YAML.parse(file)	
		const data = result
		_getObjectItem(filepath, data)
	}

	const filePath = path.resolve(rootPath, filename);
	_getTypeMap(filePath)

	return typeMap
}

const ROOT_FILEPATH = 'schema/file-format.schema.yaml'

const typeMap = getTypeMap(ROOT_FILEPATH)

typeMap.forEach((typeData) => {
	const schema = typeData['schema']
	if (!schema) return

	const type = schema['type']
	
	switch(type) {
		case 'object':
			if (schema['properties']) {
				const classStr = getClass(typeData, typeMap)
				console.log(classStr)
			} else if (schema['allOf']) {

			} else if (schema['additionalProperties']) {

			}
		break

		case 'integer':
		case 'string':
			if (schema['enum']) {
			} else if(schema['pattern']) {

			} else {

			}
		break

		default:
			if (schema['properties']) {
				
			} else if (schema['allOf']) {

			} else if (schema['additionalProperties']) {

			} else {
				console.log(schema) 
			}			
			break
	}
}) 

function getClass(typeData: any, typeMap:Map<string, any>) {
	const className = typeData['typeName']
	const properties =  typeData['schema']['properties']

	let classStr = Object.keys(properties).reduce((str:string, propName:string) => {
		const propValue = properties[propName]

		if (propValue['const']) {
			str += `  final String ${propName} = '${propValue['const']}';\n`
		} else if (propValue['$ref']) {
			console.log(propValue['$ref'])
			str += `  $ref ${propName};\n`
		} else if (propValue['type']) {
			str += `  type ${propName};\n`
		}
		return str
	}, '')

	classStr = `class ${className} {\n${classStr}}`

	console.log("\n\n\n\n\n")
	console.log(classStr)

	return ''
}