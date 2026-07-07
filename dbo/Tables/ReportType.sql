CREATE TABLE [dbo].[ReportType] (
    [ReportTypeId]   INT            IDENTITY (1, 1) NOT NULL,
    [ReportTypeCode] VARCHAR (20)   NULL,
    [ReportTypeName] NVARCHAR (100) NULL,
    [Description]    NVARCHAR (300) NULL,
    [IsActive]       BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([ReportTypeId] ASC)
);

