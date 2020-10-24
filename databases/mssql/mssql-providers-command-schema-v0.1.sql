DROP DATABASE IF EXISTS [ProviderCommandDb2];

CREATE DATABASE [ProviderCommandDb2];
GO

USE [ProviderCommandDb2];
GO

CREATE TABLE [Providers] (
	[ID_PROVIDER] [varchar](512) NOT NULL PRIMARY KEY,
	[NAME_PROVIDER] [nvarchar](max) NOT NULL,
	[NIT] [nvarchar](max) NOT NULL,
	[ID_TYPE] [varchar](512),
	[ADDRESS] [nvarchar](max) NOT NULL,
	[TELEPHONE] [bigint] NOT NULL,
	[EMAIL] [nvarchar](max) NOT NULL,
	[ID_COUNTRY] [nvarchar](max),
	[ID_PROVINCE] [nvarchar](max),
	[ID_CITY] [nvarchar](max)
)
GO

CREATE TABLE [Types] (
	[TYPES_ID] [varchar](512) NOT NULL PRIMARY KEY,
	[DESCRIPTION] [nvarchar](max) NOT NULL
)
GO

ALTER TABLE [Providers] ADD FOREIGN KEY (ID_TYPE) REFERENCES [Types] (TYPES_ID);