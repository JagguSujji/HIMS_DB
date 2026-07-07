CREATE TABLE [dbo].[AIUserFeedback] (
    [FeedbackId]     INT            IDENTITY (1, 1) NOT NULL,
    [AIRequestLogId] INT            NULL,
    [Rating]         INT            NULL,
    [Comments]       NVARCHAR (500) NULL,
    [CreatedOn]      DATETIME       DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([FeedbackId] ASC)
);

