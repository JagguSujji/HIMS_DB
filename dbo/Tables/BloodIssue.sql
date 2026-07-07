CREATE TABLE [dbo].[BloodIssue] (
    [IssueId]   BIGINT   IDENTITY (1, 1) NOT NULL,
    [PatientId] BIGINT   NULL,
    [IssueDate] DATETIME NULL,
    PRIMARY KEY CLUSTERED ([IssueId] ASC)
);

