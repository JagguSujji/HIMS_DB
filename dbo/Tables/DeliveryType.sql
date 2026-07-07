CREATE TABLE [dbo].[DeliveryType] (
    [DeliveryTypeId]   INT            IDENTITY (1, 1) NOT NULL,
    [DeliveryTypeCode] VARCHAR (20)   NULL,
    [DeliveryTypeName] NVARCHAR (100) NULL,
    [IsActive]         BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([DeliveryTypeId] ASC)
);

