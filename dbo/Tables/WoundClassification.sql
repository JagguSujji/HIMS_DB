CREATE TABLE [dbo].[WoundClassification] (
    [WoundClassificationId] INT            IDENTITY (1, 1) NOT NULL,
    [ClassificationCode]    VARCHAR (20)   NULL,
    [ClassificationName]    NVARCHAR (100) NULL,
    [IsActive]              BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([WoundClassificationId] ASC)
);

