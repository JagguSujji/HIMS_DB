CREATE TABLE [dbo].[BillingServiceCatalog] (
    [ServiceId]   BIGINT          IDENTITY (1, 1) NOT NULL,
    [ServiceCode] NVARCHAR (50)   NOT NULL,
    [ServiceName] NVARCHAR (200)  NOT NULL,
    [ServiceType] NVARCHAR (50)   NOT NULL,
    [BasePrice]   DECIMAL (18, 2) DEFAULT ((0)) NOT NULL,
    [IsActive]    BIT             DEFAULT ((1)) NOT NULL,
    [CreatedOn]   DATETIME2 (7)   DEFAULT (sysdatetime()) NOT NULL,
    PRIMARY KEY CLUSTERED ([ServiceId] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Service_Code]
    ON [dbo].[BillingServiceCatalog]([ServiceCode] ASC);

