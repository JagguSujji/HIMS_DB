CREATE TABLE [dbo].[SampleType] (
    [SampleTypeId]   INT            IDENTITY (1, 1) NOT NULL,
    [SampleTypeCode] VARCHAR (20)   NULL,
    [SampleTypeName] NVARCHAR (100) NULL,
    [IsActive]       BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([SampleTypeId] ASC)
);

