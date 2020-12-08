
import YAML from 'yaml'
import fs from 'fs'
import path from 'path'


/*
 * parsing yaml to json, add className and classPath from $ref prop.
 */
function getSchema(filePath:string) {
	const dirPath = path.dirname(filePath)
	const schema = YAML.parse(fs.readFileSync(filePath, 'utf-8'))
	
	const refToAbs = (obj:any) => {
		Object.keys(obj).forEach((propName:string) => {
			if (typeof obj[propName] == 'object') {
				refToAbs(obj[propName])
			}

			if (propName == '$ref') {
				const absPath = path.join(dirPath, obj[propName])
				
				let className = absPath.split('/')[absPath.split('/').length - 1]
														.replace('.schema.yaml', '')
														.split('-')
														.reduce((className:string, word:string) => {
															className += word[0].toUpperCase() + word.substr(1)
															return className
														}, '')
														
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

const SCHEMA_PATH = 'schema'
const schemas = getSchemas(SCHEMA_PATH)

