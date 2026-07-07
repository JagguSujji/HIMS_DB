CREATE TABLE [dbo].[LabResultValidation] (
    [ValidationId]     BIGINT         IDENTITY (1, 1) NOT NULL,
    [LabResultId]      BIGINT         NOT NULL,
    [ValidationStatus] NVARCHAR (30)  NOT NULL,
    [VerifiedBy]       BIGINT         NULL,
    [VerifiedOn]       DATETIME2 (7)  NULL,
    [Remarks]          NVARCHAR (500) NULL,
    PRIMARY KEY CLUSTERED ([ValidationId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_ResultValidation]
    ON [dbo].[LabResultValidation]([LabResultId] ASC);

