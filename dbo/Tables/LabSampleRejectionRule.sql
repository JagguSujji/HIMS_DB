CREATE TABLE [dbo].[LabSampleRejectionRule] (
    [RejectionRuleId] BIGINT         IDENTITY (1, 1) NOT NULL,
    [SampleTypeId]    BIGINT         NOT NULL,
    [RuleCode]        NVARCHAR (50)  NOT NULL,
    [RuleDescription] NVARCHAR (300) NOT NULL,
    [Severity]        NVARCHAR (30)  NOT NULL,
    [IsActive]        BIT            DEFAULT ((1)) NOT NULL,
    PRIMARY KEY CLUSTERED ([RejectionRuleId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_RejectionRule_Sample]
    ON [dbo].[LabSampleRejectionRule]([SampleTypeId] ASC);

