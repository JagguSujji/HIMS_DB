CREATE TABLE [dbo].[VendorType] (
    [VendorTypeId]   INT            IDENTITY (1, 1) NOT NULL,
    [VendorTypeCode] VARCHAR (20)   NOT NULL,
    [VendorTypeName] NVARCHAR (100) NOT NULL,
    [Description]    NVARCHAR (300) NULL,
    [IsActive]       BIT            DEFAULT ((1)) NULL,
    [CreatedOn]      DATETIME2 (7)  DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([VendorTypeId] ASC),
    UNIQUE NONCLUSTERED ([VendorTypeCode] ASC)
);

