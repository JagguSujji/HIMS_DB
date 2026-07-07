CREATE TABLE [dbo].[Asset] (
    [AssetId]           BIGINT          IDENTITY (1, 1) NOT NULL,
    [AssetCode]         NVARCHAR (30)   NOT NULL,
    [AssetName]         NVARCHAR (200)  NOT NULL,
    [AssetCategory]     NVARCHAR (100)  NOT NULL,
    [AssetType]         NVARCHAR (100)  NULL,
    [ManufacturerId]    BIGINT          NULL,
    [ModelNumber]       NVARCHAR (100)  NULL,
    [SerialNumber]      NVARCHAR (100)  NULL,
    [PurchaseDate]      DATE            NULL,
    [PurchaseCost]      DECIMAL (18, 2) NULL,
    [WarrantyStartDate] DATE            NULL,
    [WarrantyEndDate]   DATE            NULL,
    [DepartmentId]      BIGINT          NULL,
    [LocationId]        BIGINT          NULL,
    [AssignedToUserId]  BIGINT          NULL,
    [Status]            NVARCHAR (30)   CONSTRAINT [DF_Asset_Status] DEFAULT ('ACTIVE') NOT NULL,
    [IsCritical]        BIT             CONSTRAINT [DF_Asset_IsCritical] DEFAULT ((0)) NOT NULL,
    [IsActive]          BIT             CONSTRAINT [DF_Asset_IsActive] DEFAULT ((1)) NOT NULL,
    [IsDeleted]         BIT             CONSTRAINT [DF_Asset_IsDeleted] DEFAULT ((0)) NOT NULL,
    [CreatedBy]         BIGINT          NOT NULL,
    [CreatedOn]         DATETIME2 (7)   CONSTRAINT [DF_Asset_CreatedOn] DEFAULT (sysdatetime()) NOT NULL,
    [ModifiedBy]        BIGINT          NULL,
    [ModifiedOn]        DATETIME2 (7)   NULL,
    [RowVersion]        ROWVERSION      NOT NULL,
    PRIMARY KEY CLUSTERED ([AssetId] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Asset_Code]
    ON [dbo].[Asset]([AssetCode] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Asset_Department]
    ON [dbo].[Asset]([DepartmentId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Asset_Status]
    ON [dbo].[Asset]([Status] ASC);

