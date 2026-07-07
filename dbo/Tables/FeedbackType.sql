CREATE TABLE [dbo].[FeedbackType] (
    [FeedbackTypeId]   INT            IDENTITY (1, 1) NOT NULL,
    [FeedbackTypeCode] NVARCHAR (20)  NOT NULL,
    [FeedbackTypeName] NVARCHAR (100) NOT NULL,
    [Description]      NVARCHAR (500) NULL,
    [DisplayOrder]     INT            DEFAULT ((0)) NOT NULL,
    [IsActive]         BIT            DEFAULT ((1)) NOT NULL,
    [Remarks]          NVARCHAR (500) NULL,
    [CreatedBy]        BIGINT         NULL,
    [CreatedOn]        DATETIME2 (7)  DEFAULT (sysdatetime()) NOT NULL,
    [ModifiedBy]       BIGINT         NULL,
    [ModifiedOn]       DATETIME2 (7)  NULL,
    [RowVersion]       ROWVERSION     NOT NULL,
    PRIMARY KEY CLUSTERED ([FeedbackTypeId] ASC),
    CONSTRAINT [UQ_FeedbackType_Code] UNIQUE NONCLUSTERED ([FeedbackTypeCode] ASC)
);

