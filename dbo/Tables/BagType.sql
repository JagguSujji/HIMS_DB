CREATE TABLE [dbo].[BagType] (
    [BagTypeId]    INT            IDENTITY (1, 1) NOT NULL,
    [BagTypeCode]  VARCHAR (20)   NULL,
    [BagTypeName]  NVARCHAR (100) NULL,
    [NumberOfBags] INT            NULL,
    [IsActive]     BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([BagTypeId] ASC)
);

