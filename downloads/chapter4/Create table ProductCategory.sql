CREATE TABLE [dbo].[ProductCategory](
	CategoryID		INT IDENTITY(1,1)	NOT NULL,
	CategoryName	NVARCHAR(15)		NOT NULL,
	Description		NVARCHAR(255)		NULL,
	Picture			VARBINARY(MAX)		NULL
);

