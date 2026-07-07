CREATE TABLE [dbo].[DiscountType] (
    [DiscountTypeId]     INT            IDENTITY (1, 1) NOT NULL,
    [DiscountTypeCode]   VARCHAR (20)   NULL,
    [DiscountTypeName]   NVARCHAR (100) NULL,
    [IsPercentage]       BIT            NULL,
    [IsApprovalRequired] BIT            NULL,
    [IsActive]           BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([DiscountTypeId] ASC)
);

