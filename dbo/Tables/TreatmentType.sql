CREATE TABLE [dbo].[TreatmentType] (
    [TreatmentTypeId]   INT            IDENTITY (1, 1) NOT NULL,
    [TreatmentTypeCode] VARCHAR (20)   NULL,
    [TreatmentTypeName] NVARCHAR (100) NULL,
    [IsActive]          BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([TreatmentTypeId] ASC)
);

