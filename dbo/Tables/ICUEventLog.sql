CREATE TABLE [dbo].[ICUEventLog] (
    [ICUEventId]     BIGINT          IDENTITY (1, 1) NOT NULL,
    [ICUAdmissionId] BIGINT          NOT NULL,
    [EventType]      NVARCHAR (50)   NOT NULL,
    [Severity]       NVARCHAR (30)   NOT NULL,
    [Message]        NVARCHAR (1000) NOT NULL,
    [TriggeredBy]    NVARCHAR (100)  NULL,
    [EventTime]      DATETIME2 (7)   DEFAULT (sysdatetime()) NOT NULL,
    PRIMARY KEY CLUSTERED ([ICUEventId] ASC),
    CONSTRAINT [FK_ICUEvent_ICUAdmission] FOREIGN KEY ([ICUAdmissionId]) REFERENCES [dbo].[ICUAdmission] ([ICUAdmissionId])
);


GO
CREATE NONCLUSTERED INDEX [IX_ICUEvent_Admission]
    ON [dbo].[ICUEventLog]([ICUAdmissionId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_ICUEvent_Severity]
    ON [dbo].[ICUEventLog]([Severity] ASC);

