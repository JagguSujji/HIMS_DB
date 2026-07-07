CREATE TABLE [dbo].[Feedback] (
    [FeedbackId] INT            NOT NULL,
    [PatientId]  INT            NULL,
    [Rating]     INT            NULL,
    [Comments]   NVARCHAR (MAX) NULL,
    [CreatedOn]  DATETIME       NULL,
    PRIMARY KEY CLUSTERED ([FeedbackId] ASC)
);

