CREATE TABLE [dbo].[LabTest] (
    [LabTestId]      BIGINT         IDENTITY (1, 1) NOT NULL,
    [TestCode]       VARCHAR (30)   NULL,
    [TestName]       NVARCHAR (200) NULL,
    [TestCategoryId] INT            NULL,
    [LabSectionId]   INT            NULL,
    [SampleTypeId]   INT            NULL,
    [ResultUnitId]   INT            NULL,
    [IsActive]       BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([LabTestId] ASC),
    FOREIGN KEY ([LabSectionId]) REFERENCES [dbo].[LabSection] ([LabSectionId]),
    FOREIGN KEY ([SampleTypeId]) REFERENCES [dbo].[SampleType] ([SampleTypeId]),
    FOREIGN KEY ([TestCategoryId]) REFERENCES [dbo].[TestCategory] ([TestCategoryId]),
    UNIQUE NONCLUSTERED ([TestCode] ASC)
);

