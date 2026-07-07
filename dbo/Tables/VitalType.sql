CREATE TABLE [dbo].[VitalType] (
    [VitalTypeId]     INT            IDENTITY (1, 1) NOT NULL,
    [VitalCode]       VARCHAR (20)   NULL,
    [VitalName]       NVARCHAR (100) NULL,
    [UnitOfMeasureId] INT            NOT NULL,
    [NormalRange]     NVARCHAR (100) NULL,
    [DisplayOrder]    INT            NULL,
    [IsActive]        BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([VitalTypeId] ASC),
    CONSTRAINT [FK_VitalType_Unit] FOREIGN KEY ([UnitOfMeasureId]) REFERENCES [dbo].[UnitOfMeasure] ([UnitOfMeasureId])
);

