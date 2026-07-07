CREATE TABLE [dbo].[FeedbackSource] (
    [FeedbackSourceId]   INT            IDENTITY (1, 1) NOT NULL,
    [FeedbackSourceCode] NVARCHAR (20)  NOT NULL,
    [FeedbackSourceName] NVARCHAR (150) NOT NULL,
    [Description]        NVARCHAR (500) NULL,
    [DisplayOrder]       INT            DEFAULT ((0)) NOT NULL,
    [IsActive]           BIT            DEFAULT ((1)) NOT NULL,
    [Remarks]            NVARCHAR (500) NULL,
    [CreatedBy]          BIGINT         NULL,
    [CreatedOn]          DATETIME2 (7)  DEFAULT (sysdatetime()) NOT NULL,
    [ModifiedBy]         BIGINT         NULL,
    [ModifiedOn]         DATETIME2 (7)  NULL,
    [RowVersion]         ROWVERSION     NOT NULL,
    PRIMARY KEY CLUSTERED ([FeedbackSourceId] ASC),
    CONSTRAINT [UQ_FeedbackSource_Code] UNIQUE NONCLUSTERED ([FeedbackSourceCode] ASC)
);

