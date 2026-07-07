CREATE TABLE [dbo].[DischargeSummary] (
    [DischargeSummaryId]   INT            NOT NULL,
    [AdmissionId]          INT            NULL,
    [PatientId]            INT            NULL,
    [SummaryText]          NVARCHAR (MAX) NULL,
    [FollowUpInstructions] NVARCHAR (MAX) NULL,
    [CreatedOn]            DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([DischargeSummaryId] ASC)
);

