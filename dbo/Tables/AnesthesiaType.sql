CREATE TABLE [dbo].[AnesthesiaType] (
    [AnesthesiaTypeId]   INT            IDENTITY (1, 1) NOT NULL,
    [AnesthesiaTypeCode] VARCHAR (20)   NULL,
    [AnesthesiaTypeName] NVARCHAR (100) NULL,
    [IsActive]           BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([AnesthesiaTypeId] ASC)
);

