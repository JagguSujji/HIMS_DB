CREATE TABLE [dbo].[ServiceCatalog] (
    [ServiceId]   INT             NOT NULL,
    [ServiceCode] VARCHAR (50)    NULL,
    [ServiceName] VARCHAR (200)   NULL,
    [BasePrice]   DECIMAL (10, 2) NULL,
    PRIMARY KEY CLUSTERED ([ServiceId] ASC)
);

