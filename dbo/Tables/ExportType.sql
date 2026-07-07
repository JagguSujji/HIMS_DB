CREATE TABLE [dbo].[ExportType] (
    [ExportTypeId]   INT            IDENTITY (1, 1) NOT NULL,
    [ExportTypeCode] VARCHAR (20)   NULL,
    [ExportTypeName] NVARCHAR (100) NULL,
    [IsActive]       BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([ExportTypeId] ASC)
);

