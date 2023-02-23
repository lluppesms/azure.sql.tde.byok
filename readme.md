# Create Azure SQL Database using Bicep

This repo contains an example and notes on creating an Azure SQL Database with Customer Managed TDE using Bicep.

For Azure SQL Database, the TDE protector is set at the server level and is inherited by all encrypted databases associated with that server.

For Azure SQL Managed Instance, the TDE protector is set at the instance level and is inherited by all encrypted databases on that instance.

For those using service-managed TDE who would like to start using customer-managed TDE, data remains encrypted during the process of switching over, and there is no downtime nor re-encryption of the database files. Switching from a service-managed key to a customer-managed key only requires re-encryption of the DEK, which is a fast and online operation.

---

## TDE Concept Articles

[TDE on SQL Server with Customer Managed Key - MS Learn](https://learn.microsoft.com/en-us/azure/azure-sql/database/transparent-data-encryption-byok-overview?view=azuresql)

[Enable TDE on SQL Server with PowerShell - MS Learn](https://learn.microsoft.com/en-us/azure/azure-sql/database/transparent-data-encryption-byok-configure?view=azuresql&tabs=azure-powershell)

---

## Security Settings

Note: The Managed Identity of the SQL server must have Key Vault Access policy of:

`"key: [ 'get', 'wrapKey', 'unwrapKey' ]"`

in order to access the selected key vault for TDE.

---

## Bicep Files and Definitions

[Create an Azure SQL Server, with data encryption protector](https://github.com/Azure/azure-quickstart-templates/tree/master/application-workloads/sql/sql-encryption-protector-byok)

<!-- [Very Simple SQL Server Bicep](https://learn.microsoft.com/en-us/azure/azure-sql/database/single-database-create-bicep-quickstart?view=azuresql&tabs=CLI) -->

[Bicep Specs: SQL Server](https://learn.microsoft.com/en-us/azure/templates/microsoft.sql/servers?pivots=deployment-language-bicep)

[Bicep Specs: SQL Database](https://learn.microsoft.com/en-us/azure/templates/microsoft.sql/servers/databases?pivots=deployment-language-bicep)

[Bicep Specs: SQL Encryption Key](https://learn.microsoft.com/en-us/azure/templates/microsoft.sql/servers/encryptionprotector?pivots=deployment-language-bicep)

[Bicep Specs: KeyVault Keys](https://learn.microsoft.com/en-us/azure/templates/microsoft.keyvault/vaults/keys?tabs=bicep&pivots=deployment-language-bicep)

[Bicep Specs: KeyVault Access Policies](https://learn.microsoft.com/en-us/azure/templates/microsoft.keyvault/vaults/accesspolicies?pivots=deployment-language-bicep)

---

## See Also

https://stackoverflow.com/questions/74222622/configuring-encryption-protection-in-azure-sql-server-using-arm-bicep

https://ochzhen.com/blog/get-keyvault-and-secret-url-and-id
