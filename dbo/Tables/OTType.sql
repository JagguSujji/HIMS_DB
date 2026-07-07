CREATE TABLE [dbo].[OTType] (
    [OTTypeId]   INT            IDENTITY (1, 1) NOT NULL,
    [OTTypeCode] VARCHAR (20)   NULL,
    [OTTypeName] NVARCHAR (100) NULL,
    [IsActive]   BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([OTTypeId] ASC)
);

