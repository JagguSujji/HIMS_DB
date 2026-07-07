CREATE TABLE [dbo].[LabQCSpecimenRule] (
    [QCRuleId]        BIGINT          IDENTITY (1, 1) NOT NULL,
    [LabTestId]       BIGINT          NOT NULL,
    [RuleType]        NVARCHAR (50)   NOT NULL,
    [MinValue]        DECIMAL (18, 4) NULL,
    [MaxValue]        DECIMAL (18, 4) NULL,
    [CriticalLow]     DECIMAL (18, 4) NULL,
    [CriticalHigh]    DECIMAL (18, 4) NULL,
    [UnitOfMeasureId] BIGINT          NULL,
    [IsActive]        BIT             DEFAULT ((1)) NOT NULL,
    [CreatedOn]       DATETIME2 (7)   DEFAULT (sysdatetime()) NOT NULL,
    PRIMARY KEY CLUSTERED ([QCRuleId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_LabQC_Test]
    ON [dbo].[LabQCSpecimenRule]([LabTestId] ASC);

