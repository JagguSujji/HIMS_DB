CREATE TABLE [dbo].[FeedbackStatus] (
    [FeedbackStatusId]   INT            IDENTITY (1, 1) NOT NULL,
    [FeedbackStatusCode] NVARCHAR (20)  NOT NULL,
    [FeedbackStatusName] NVARCHAR (100) NOT NULL,
    [DisplayOrder]       INT            DEFAULT ((0)) NOT NULL,
    [IsClosed]           BIT            DEFAULT ((0)) NOT NULL,
    [IsActive]           BIT            DEFAULT ((1)) NOT NULL,
    [Remarks]            NVARCHAR (500) NULL,
    [CreatedBy]          BIGINT         NULL,
    [CreatedOn]          DATETIME2 (7)  DEFAULT (sysdatetime()) NOT NULL,
    [ModifiedBy]         BIGINT         NULL,
    [ModifiedOn]         DATETIME2 (7)  NULL,
    [RowVersion]         ROWVERSION     NOT NULL,
    PRIMARY KEY CLUSTERED ([FeedbackStatusId] ASC),
    CONSTRAINT [UQ_FeedbackStatus_Code] UNIQUE NONCLUSTERED ([FeedbackStatusCode] ASC)
);

