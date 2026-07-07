CREATE TABLE [dbo].[AIResponseFeedbackTag] (
    [FeedbackTagId] BIGINT       IDENTITY (1, 1) NOT NULL,
    [FeedbackId]    BIGINT       NULL,
    [Tag]           VARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([FeedbackTagId] ASC)
);

