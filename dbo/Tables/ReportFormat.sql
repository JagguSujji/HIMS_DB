CREATE TABLE [dbo].[ReportFormat] (
    [ReportFormatId] INT            IDENTITY (1, 1) NOT NULL,
    [FormatCode]     VARCHAR (20)   NULL,
    [FormatName]     NVARCHAR (100) NULL,
    [FileExtension]  VARCHAR (10)   NULL,
    [MimeType]       VARCHAR (100)  NULL,
    [IsActive]       BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([ReportFormatId] ASC)
);

