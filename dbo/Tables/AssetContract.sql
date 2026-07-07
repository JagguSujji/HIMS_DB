CREATE TABLE [dbo].[AssetContract] (
    [ContractId]   BIGINT          IDENTITY (1, 1) NOT NULL,
    [AssetId]      BIGINT          NOT NULL,
    [VendorName]   NVARCHAR (150)  NOT NULL,
    [ContractType] NVARCHAR (50)   NOT NULL,
    [StartDate]    DATE            NOT NULL,
    [EndDate]      DATE            NOT NULL,
    [Cost]         DECIMAL (18, 2) NULL,
    [IsActive]     BIT             DEFAULT ((1)) NOT NULL,
    PRIMARY KEY CLUSTERED ([ContractId] ASC)
);

