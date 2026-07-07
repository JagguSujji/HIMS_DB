CREATE TABLE [dbo].[PolicyType] (
    [PolicyTypeId]   INT            IDENTITY (1, 1) NOT NULL,
    [PolicyTypeCode] VARCHAR (20)   NULL,
    [PolicyTypeName] NVARCHAR (100) NULL,
    [IsFamilyPolicy] BIT            NULL,
    [IsActive]       BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([PolicyTypeId] ASC)
);

