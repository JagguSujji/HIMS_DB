CREATE TABLE [dbo].[AIModel] (
    [AIModelId]      INT            IDENTITY (1, 1) NOT NULL,
    [ModelCode]      VARCHAR (30)   NULL,
    [ModelName]      NVARCHAR (200) NULL,
    [VendorName]     NVARCHAR (100) NULL,
    [ModelType]      VARCHAR (50)   NULL,
    [CurrentVersion] VARCHAR (50)   NULL,
    [IsActive]       BIT            DEFAULT ((1)) NULL,
    [CreatedOn]      DATETIME2 (7)  DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([AIModelId] ASC),
    UNIQUE NONCLUSTERED ([ModelCode] ASC)
);

