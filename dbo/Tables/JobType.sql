CREATE TABLE [dbo].[JobType] (
    [JobTypeId]   INT            IDENTITY (1, 1) NOT NULL,
    [JobTypeCode] VARCHAR (20)   NULL,
    [JobTypeName] NVARCHAR (100) NULL,
    [IsPermanent] BIT            NULL,
    [IsActive]    BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([JobTypeId] ASC)
);

