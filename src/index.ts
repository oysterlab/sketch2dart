
import YAML from 'yaml'
import fs from 'fs'
import path from 'path'
const chalk = require('chalk')

function getClassAliasName(schema: any) {
    let alias = null
    const _getClassAliasName = (property:any) => {
        Object.keys(property).forEach((propName:string) => {
            const prop = property[propName]
            if (propName == '_class') {
                alias = prop['const']
            } else if (typeof prop == 'object') {
                _getClassAliasName(prop)
            } 
        })
    }
    _getClassAliasName(schema)
    return alias
}

function _generateOneOfSwitchCode(oneOfs:any, propName: string) {
	const varName = propName + "_t"
	let importCode = ''
	let switchCode = "    dynamic " + varName + " = map['" + propName + "'];\n" +
					 "    if (" + varName+ " != null) {\n"
	switchCode += "      switch(" + varName + "['_class']) {\n" 
	switchCode += oneOfs.reduce((switchCodeSnippet:string, oneOf:any) => {
		if (oneOf['$ref']) {
			importCode += "import '" + path.dirname(oneOf['$ref']) + '/' + oneOf['className'] + ".dart';\n"
		}

		const _class = oneOf['_class']
		const classType = oneOf['classType']
		const className = oneOf['className']	
		
		if (_class) {
			switchCodeSnippet += "        case '" + _class + "':\n"
			if (classType == 'Object') {
				switchCodeSnippet += "          model." + propName + " = map['"+propName+"'] != null ? new " + className + ".fromMap(map['"+propName+"']) : null;\n"
			}
			switchCodeSnippet += "          break;\n\n"
		}
		return switchCodeSnippet
	}, '')
	switchCode += "        default:\n"
	switchCode += "          break;\n"			
	switchCode += "      }\n" 
	switchCode += "    }\n" 	

	return {
		switchCode, importCode
	}
}

function _generateOneOfSwitchCodeArray(oneOfs:any, propName: string) {
	
	let importCode = ''

	let code = ''
	code += "    if (map['" + propName + "'] != null) {\n"
	code += "      model."+propName+" = map['" + propName + "'].map((d) {\n"
	code += "        dynamic model = null;\n"


	let switchCode = "        switch(d['_class']) {\n" 
	switchCode += oneOfs.reduce((switchCodeSnippet:string, oneOf:any) => {
		if (oneOf['$ref']) {
			importCode += "import '" + path.dirname(oneOf['$ref']) + '/' + oneOf['className'] + ".dart';\n"
		}

		const _class = oneOf['_class']
		const classType = oneOf['classType']
		const className = oneOf['className']	
		
		if (_class) {
			switchCodeSnippet += "          case '" + _class + "':\n"
			
			if (classType == 'Object') {
				switchCodeSnippet += "            model = new " + className + ".fromMap(d);\n"
			}
			switchCodeSnippet += "            break;\n\n"
		}
		return switchCodeSnippet
	}, '')
	switchCode += "          default:\n"
	switchCode += "            break;\n"			
	switchCode += "        }\n" 

	code += switchCode +"\n"



	code += "        return model;\n"
	code += "      }).toList();\n"	
	code += "    }\n"	


	return {
		switchCode: code, importCode
	}
}

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
				const refSchema = YAML.parse(fs.readFileSync('./' + absPath, 'utf-8'))
				let classType = refSchema.type

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

					case 'object':
						classType = 'Object'
						break

					default:
						classType = 'Object'
						break
				}
				
				obj['_class'] = getClassAliasName(refSchema)
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

function _generateDataClassFunctionCode(schema: any) {
	const className = schema['className']
	const allOf = schema['allOf']
	let properties = schema['properties']
	let constructorCode = ''
	let fromMapCode = ''
	let toMapCode = ''
	let toStringCode = ''
	let setModelWithMapCode = ''
	let parentClass = null
	let importCode = ''

	if (allOf) {
		properties = allOf[1]['properties']
		parentClass = allOf[0]['className']
		setModelWithMapCode = '\n    ' + parentClass+ '.setModelWithMap(map, model);\n'
	}

	if (!properties) properties = {}


	Object.keys(properties).forEach((propName: string) => {
		const prop = properties[propName]

		if (prop.hasOwnProperty('type')) {
			switch (prop['type']) {
				case 'integer':
				case 'boolean':
				case 'string':
				case 'object': //dynamic
					setModelWithMapCode += '\n    model.' + propName + " = map['"+propName+"'];\n"
				break

				case 'number':
					setModelWithMapCode += '\n    model.' + propName + " = map['"+propName+"'] != null ? map['"+propName+"'].toDouble() : 0.0;\n"
				break

				case 'array':
					if (prop.hasOwnProperty('items')) {	//has a type
						const items = prop['items']
						if (items.hasOwnProperty('$ref')) {
							const ref = items['$ref']
							const className = items['className']

							importCode += "import '" + path.dirname(ref) + '/' + className + ".dart';\n"
							
							setModelWithMapCode += '\n'
							setModelWithMapCode += "    if (map['" + propName + "'] != null) {\n"
							setModelWithMapCode += "       model." + propName + " = map['"+propName+"'].map((d) => new " + className + '.fromMap(d)).toList();\n'		
							setModelWithMapCode += "    }\n"					
 
						} else if (items.hasOwnProperty('oneOf')) {
							const oneOfs = items['oneOf']
							const switchCodeResult = _generateOneOfSwitchCodeArray(oneOfs, propName)
							
							importCode += switchCodeResult.importCode
							setModelWithMapCode += switchCodeResult.switchCode

						} else if (items.hasOwnProperty('type')) {
							const itemType = (items['type'])
							switch(itemType) {
								case 'integer':
									setModelWithMapCode += '\n    model.' + propName + " = List<int>.from(map['"+propName+"']);\n"
									break
								case 'number':
									setModelWithMapCode += '\n    model.' + propName + " = List<double>.from(map['"+propName+"']);\n"
									break
								case 'string':
									setModelWithMapCode += '\n    model.' + propName + " = List<String>.from(map['"+propName+"']);\n"
									break		
								
								default:
									console.log('------------ unkwoun item type in')
									console.log(className)
									console.log(items)
									console.log('\n\n')		
									break
							}
						}
					} else {	//dynamic
						setModelWithMapCode += '\n    model.' + propName + " = List.from(map['"+propName+"']);\n"
					}
				break
			}
		} else if (prop.hasOwnProperty('$ref')) {
			const classType = prop['classType']
			const className = prop['className']
			if (classType == 'Object') {
				setModelWithMapCode += '\n    model.' + propName + " = map['"+propName+"'] != null ? new " + className + ".fromMap(map['"+propName+"']) : null;\n"
			} else if (classType == 'double') {
				setModelWithMapCode += '\n    model.' + propName + " = map['"+propName+"'].toDouble();\n"
			} else {
				setModelWithMapCode += '\n    model.' + propName + " = map['"+propName+"'];\n"				
			}

		} else if (prop.hasOwnProperty('allOf')) {
			// ???	
		} else if (prop.hasOwnProperty('oneOf')) {
			const oneOfs = prop['oneOf']
			
			const switchCodeResult = _generateOneOfSwitchCode(oneOfs, propName)

			importCode += switchCodeResult.importCode
			setModelWithMapCode += '\n' + switchCodeResult.switchCode

		}
	  })
	
	let constructorFunctionCode = 
	'  ' + className + '('

    if (constructorCode.length > 0) {
		constructorFunctionCode += ('{' + constructorCode + '}\n  ')
	}
	constructorFunctionCode +=
	');\n'

	const setModelWithMapFunctionCode = 
	 '  static setModelWithMap(Map<String, dynamic> map, ' + className + ' model) {' + 
	 ""	+ setModelWithMapCode + '\n' + 
	 '	}\n'

	const fromMapFunctionCode =
	 '  factory ' + className + '.fromMap(Map<String, dynamic> map) {\n' +
	 '    if (map == null) return null;\n' +
	 "    " + className + " model = " + className + "();\n" +
	 "	  " + className + ".setModelWithMap(map, model);\n" + 	
	 '    return model;\n' +
	 '  }\n'

	 const toMapFunctionCode = 
	 '  Map<String, dynamic> toMap() {\n' +
	 '	  return {\n' +
	  	toMapCode +
	 '    };\n' +
	 '  }\n'

	 const toStringFunctionCode = 
	 '  @override\n' +
	 '  String toString() {\n' + 
	 '    return \'' + className + '(' + toStringCode + ')\';\n' +
	 '  }\n'


	return {
		importCode: importCode,
		dataClassCode: constructorFunctionCode + '\n' + 
						setModelWithMapFunctionCode + '\n' +
						fromMapFunctionCode + '\n' + 
						toMapFunctionCode + '\n' +
						toStringFunctionCode
	}
}

function _generateClassCode(schema: any, isSubClass: boolean = false) {
	const className = schema['className']
	const allOf = schema['allOf']
	let properties = schema['properties']
	let definePropsCodes = ''
	let importCodes = ''
	let extendsCode = ''
	let subClassCode = ''
	let dataClassCode = ''

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

					const sub:any = _generateClassCode(prop, true)
					importCodes += sub['importCodes']
					subClassCode += sub['classCode']

				break
			}
		} else if (prop.hasOwnProperty('$ref')) {
			const classType = prop['classType']
			
			if (classType == 'Object') {
				type = prop['className']
				const importCode = "import '"+path.dirname(prop['$ref']) + '/' + type + ".dart';\n"
				importCodes += importCode
			} else {
				type = classType
			}

		} else if (prop.hasOwnProperty('allOf')) {
			prop['className'] = className + '_' + prop['allOf'][0]['className']
			type = prop['className']

			const sub:any = _generateClassCode(prop, true)
			importCodes += sub['importCodes']
			subClassCode += sub['classCode']
		} else if (prop.hasOwnProperty('oneOf')) {
			type = 'dynamic'
		} 
		else {
			console.log(chalk.red('----------- unknown property "'+ propName + '" in ' + className + '\n' + JSON.stringify(prop, null, 2))+'\n\n')
		}
  
		dartCode += '  ' + type + ' ' + propName + propValue + ';\n'
		return dartCode
	}, '')

	const dataClassResult = _generateDataClassFunctionCode(schema)

	importCodes += dataClassResult['importCode']
	dataClassCode += dataClassResult['dataClassCode']

	if (isSubClass) {
		const subClassCode = 'class ' + className + extendsCode + ' {\n'
		+ definePropsCodes + '\n'
		+ dataClassCode + '\n'
		+ '} \n'
		const subImportCode = importCodes
		return {
			classCode: subClassCode,
			importCodes: subImportCode
		}
	} else {
		return importCodes + '\n'
		+ 'class ' + className + extendsCode + ' {\n'
	 + definePropsCodes + '\n'
	 + dataClassCode + '\n'
	 + '} \n' + subClassCode
	}


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

	return 'class ' + className + ' {\n' +
		'    dynamic value;\n\n' +
		'    ' + className + '();\n\n' +		
		'    factory ' + className + '.fromMap(Map<String, dynamic> map) {\n' +
		'      if (map == null) return null;\n' +
		'      ' + className + ' model = ' + className + '();\n' +
		'      model.value = map;\n' + 	
		'      return model;\n' + 		
		'    }\n' + 
		'}\n';
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
	const dartCode = generateDartCode(schema) as string;
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
