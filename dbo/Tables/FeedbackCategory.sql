CREATE TABLE [dbo].[FeedbackCategory] (
    [FeedbackCategoryId]   INT            IDENTITY (1, 1) NOT NULL,
    [FeedbackCategoryCode] NVARCHAR (20)  NOT NULL,
    [FeedbackCategoryName] NVARCHAR (150) NOT NULL,
    [DepartmentId]         BIGINT         NULL,
    [Description]          NVARCHAR (500) NULL,
    [DisplayOrder]         INT            DEFAULT ((0)) NOT NULL,
    [IsActive]             BIT            DEFAULT ((1)) NOT NULL,
    [Remarks]              NVARCHAR (500) NULL,
    [CreatedBy]            BIGINT         NULL,
    [CreatedOn]            DATETIME2 (7)  DEFAULT (sysdatetime()) NOT NULL,
    [ModifiedBy]           BIGINT         NULL,
    [ModifiedOn]           DATETIME2 (7)  NULL,
    [RowVersion]           ROWVERSION     NOT NULL,
    PRIMARY KEY CLUSTERED ([FeedbackCategoryId] ASC),
    CONSTRAINT [UQ_FeedbackCategory_Code] UNIQUE NONCLUSTERED ([FeedbackCategoryCode] ASC)
);

