CREATE TABLE [dbo].[NormalRange] (
    [NormalRangeId] BIGINT          IDENTITY (1, 1) NOT NULL,
    [LabTestId]     BIGINT          NULL,
    [GenderId]      INT             NULL,
    [AgeFrom]       DECIMAL (6, 2)  NULL,
    [AgeTo]         DECIMAL (6, 2)  NULL,
    [MinimumValue]  DECIMAL (18, 4) NULL,
    [MaximumValue]  DECIMAL (18, 4) NULL,
    [ResultUnitId]  INT             NULL,
    PRIMARY KEY CLUSTERED ([NormalRangeId] ASC),
    FOREIGN KEY ([LabTestId]) REFERENCES [dbo].[LabTest] ([LabTestId])
);

