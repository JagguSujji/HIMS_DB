CREATE TABLE [dbo].[LabInstrumentValidation] (
    [ValidationId]   BIGINT         IDENTITY (1, 1) NOT NULL,
    [InstrumentId]   BIGINT         NOT NULL,
    [ValidationType] NVARCHAR (50)  NOT NULL,
    [Status]         NVARCHAR (30)  NOT NULL,
    [ValidatedOn]    DATETIME2 (7)  DEFAULT (sysdatetime()) NOT NULL,
    [ValidatedBy]    BIGINT         NULL,
    [Remarks]        NVARCHAR (500) NULL,
    PRIMARY KEY CLUSTERED ([ValidationId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_InstrumentValidation]
    ON [dbo].[LabInstrumentValidation]([InstrumentId] ASC);

