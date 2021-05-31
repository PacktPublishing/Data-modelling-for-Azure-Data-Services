-- A: Create a master key.
-- Only necessary if one does not already exist.
-- Required to encrypt the credential secret in the next step.

CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'Th1s1sR3aIIyS3cr3t';

-- B: Create a database scoped credential
-- IDENTITY: AAD application clientID @ OAuth_2.9_Token_EndPoint
-- SECRET: Application key.
CREATE DATABASE SCOPED CREDENTIAL AzureStorageAccountCredential
WITH
    IDENTITY = '<Application (client) ID>@< OAuth 2.0 token endpoint (v1)>', 
    SECRET = '<client secret>' 
;


-- C: Create an external data source
-- TYPE: HADOOP - PolyBase uses Hadoop APIs to access data in Azure blob storage.
-- LOCATION: Provide Azure storage account name and blob container name.
-- CREDENTIAL: Provide the credential created in the previous step.

CREATE EXTERNAL DATA SOURCE AzureStorage
WITH (
    TYPE = HADOOP,
    LOCATION = 'abfss://<ContainerName>@<StorageAccountName>.blob.core.windows.net',
    CREDENTIAL = AzureStorageAccountCredential
);

-- DROP EXTERNAL FILE FORMAT TextFile
CREATE EXTERNAL FILE FORMAT TextFile 
WITH 
(
     FORMAT_TYPE = DelimitedText
	 , FORMAT_OPTIONS (FIELD_TERMINATOR = ','
						, FIRST_ROW = 2) 
);


