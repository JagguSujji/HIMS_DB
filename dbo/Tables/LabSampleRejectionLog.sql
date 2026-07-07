CREATE TABLE [dbo].[LabSampleRejectionLog] (
    [RejectionId] BIGINT         IDENTITY (1, 1) NOT NULL,
    [LabSampleId] BIGINT         NOT NULL,
    [RuleId]      BIGINT         NOT NULL,
    [Reason]      NVARCHAR (500) NOT NULL,
    [RejectedBy]  BIGINT         NULL,
    [RejectedOn]  DATETIME2 (7)  DEFAULT (sysdatetime()) NOT NULL,
    PRIMARY KEY CLUSTERED ([RejectionId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_SampleRejection_Sample]
    ON [dbo].[LabSampleRejectionLog]([LabSampleId] ASC);

