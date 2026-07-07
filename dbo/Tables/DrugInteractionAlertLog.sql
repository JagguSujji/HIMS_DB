CREATE TABLE [dbo].[DrugInteractionAlertLog] (
    [AlertId]      INT            NOT NULL,
    [Drug1Id]      INT            NULL,
    [Drug2Id]      INT            NULL,
    [Severity]     VARCHAR (50)   NULL,
    [AlertMessage] NVARCHAR (MAX) NULL,
    [CreatedOn]    DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([AlertId] ASC)
);

