CREATE TABLE [dbo].[DonorType] (
    [DonorTypeId]   INT            IDENTITY (1, 1) NOT NULL,
    [DonorTypeCode] VARCHAR (20)   NULL,
    [DonorTypeName] NVARCHAR (100) NULL,
    [IsActive]      BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([DonorTypeId] ASC)
);

