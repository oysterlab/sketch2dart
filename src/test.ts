import YAML from 'yaml'
import fs from 'fs'


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

const TEST_PATH = 'schema/layers/hotspot.schema.yaml'
const schema = YAML.parse(fs.readFileSync(TEST_PATH, 'utf-8'))

const alias = getClassAliasName(schema)

console.log(alias)