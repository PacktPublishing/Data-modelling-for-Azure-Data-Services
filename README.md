


# Data Modeling for Azure Data Services

<a href="https://www.packtpub.com/product/data-modeling-for-azure-data-services/9781801077347"><img src="https://static.packt-cdn.com/products/9781801077347/cover/smaller" alt="Book Name" height="256px" align="right"></a>

This is the code repository for [Data Modeling for Azure Data Services](https://www.packtpub.com/product/data-modeling-for-azure-data-services/9781801077347), published by Packt.

**Implement professional data design and structures in Azure**

## What is this book about?
Data is at the heart of all applications and forms the foundation of modern data-driven businesses. With the multitude of data-related use cases and the availability of different data services, choosing the right service and implementing the right design becomes paramount to successful implementation.

This book covers the following exciting features: 
* Model relational database using normalization, dimensional, or Data Vault modeling
* Provision and implement Azure SQL DB and Azure Synapse SQL Pools
* Discover how to model a Data Lake and implement it using Azure Storage
* Model a NoSQL database and provision and implement an Azure Cosmos DB
* Use Azure Data Factory to implement ETL/ELT processes
* Create a star schema model using dimensional modeling

If you feel this book is for you, get your [copy](https://www.amazon.com/Data-Modeling-Azure-Services-professional-ebook/dp/B096T14FCQ/ref=sr_1_5?dchild=1&keywords=Data+Modeling+for+Azure+Data+Services&qid=1624620492&s=books&sr=1-5) today!

<a href="https://www.packtpub.com/?utm_source=github&utm_medium=banner&utm_campaign=GitHubBanner"><img src="https://raw.githubusercontent.com/PacktPublishing/GitHub/master/GitHub.png" alt="https://www.packtpub.com/" border="5" /></a>

## Instructions and Navigations
All of the code is organized into folders. For example, Chapter06.

The code will look like the following:
```
CREATE TABLE [dbo].[Customer]
(
    CustomerID          INT IDENTITY(1,1)   NOT NULL,
    CompanyName         NVARCHAR(40)        NOT NULL,
    ContactName         NVARCHAR(30)        NULL,
    ContactTitle        NVARCHAR(30)        NULL,
    Address             NVARCHAR(60)        NULL,
    City                NVARCHAR(15)        NULL,
    Region              NVARCHAR(15)        NULL,
    PostalCode          NVARCHAR(10)        NULL,
    Country             NVARCHAR(15)        NULL,
    Phone               NVARCHAR(24)        NULL,
    Fax                 NVARCHAR(24)        NULL
);
GO

```

**Following is what you need for this book:**
This book is for business intelligence developers and consultants who work on (modern) cloud data warehousing and design and implement databases. Beginner-level knowledge of cloud data management is expected.

With the following software and hardware list you can run all code files present in the book (Chapter 1-11).

### Software and Hardware List

| Chapter  | Software required                                                                                  | OS required                        |
| -------- | ---------------------------------------------------------------------------------------------------| -----------------------------------|
| 1-11     | Microsoft Azure Account, Azure Data Studio												                                  | Windows, Mac OS X, and Linux (Any) |
| 6        | Azure CosmosDB Data Migration Tool 											                                          | Windows, Mac OS X, and Linux (Any) |



We also provide a PDF file that has color images of the screenshots/diagrams used in this book. [Click here to download it](https://static.packt-cdn.com/downloads/9781801077347_ColorImages.pdf).

### Related products <Other books you may enjoy>
* Hands-On Data Warehousing with Azure Data Factory [[Packt]](https://www.packtpub.com/product/hands-on-data-warehousing-with-azure-data-factory/9781789137620) [[Amazon]](https://www.amazon.in/Hands-Warehousing-Azure-Factory-premises/dp/1789137624)

* Azure Data Engineering Cookbook [[Packt]](https://www.packtpub.com/product/azure-data-engineering-cookbook/9781800206557) [[Amazon]](https://www.amazon.in/Azure-Data-Engineering-Cookbook-implement/dp/1800206550)

## Get to Know the Author
**Peter ter Braake**
He started working as a developer in 1996 after studying physics in Utrecht, the Netherlands. Databases and business intelligence piqued his interest the most, leading to him specializing in SQL Server and its business intelligence components. He has worked with Power BI from the tool's very beginnings. Peter started working as an independent contractor in 2008. This has enabled him to divide his time between teaching data-related classes, consulting with customers, and writing articles and books.
### Download a free PDF

 <i>If you have already purchased a print or Kindle version of this book, you can get a DRM-free PDF version at no cost.<br>Simply click on the link to claim your free PDF.</i>
<p align="center"> <a href="https://packt.link/free-ebook/9781801077347">https://packt.link/free-ebook/9781801077347 </a> </p>