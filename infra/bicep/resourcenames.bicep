param orgName string = 'org'
param appName string = 'app'
@allowed(['dev','demo','qa','stg','prod'])
param environment string = 'dev'

// --------------------------------------------------------------------------------
var  sanitizedOrgName      = replace(replace(replace(toLower(orgName), ' ', ''), '-', ''), '_', '')
var  sanitizedAppName      = replace(replace(replace(toLower(appName), ' ', ''), '-', ''), '_', '')
var  sanitizedEnvironment  = toLower(environment)

// --------------------------------------------------------------------------------
output sqlServerName string = toLower('${sanitizedOrgName}${sanitizedAppName}sql${sanitizedEnvironment}')

// Key Vaults and Storage Accounts can only be 24 characters long
output keyVaultName string = take(toLower('${sanitizedOrgName}${sanitizedAppName}vault${sanitizedEnvironment}'), 24)
