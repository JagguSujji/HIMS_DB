CREATE TABLE [dbo].[FeedbackActivityType] (
    [FeedbackActivityTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [ActivityCode]           NVARCHAR (50)  NOT NULL,
    [ActivityName]           NVARCHAR (100) NOT NULL,
    [Description]            NVARCHAR (250) NULL,
    [DisplayOrder]           INT            NULL,
    [IsSystemActivity]       BIT            DEFAULT ((0)) NOT NULL,
    [IsActive]               BIT            DEFAULT ((1)) NOT NULL,
    [CreatedOn]              DATETIME2 (7)  DEFAULT (sysdatetime()) NOT NULL,
    [RowVersion]             ROWVERSION     NOT NULL,
    CONSTRAINT [PK_FeedbackActivityType] PRIMARY KEY CLUSTERED ([FeedbackActivityTypeId] ASC),
    CONSTRAINT [UQ_FeedbackActivityType_Code] UNIQUE NONCLUSTERED ([ActivityCode] ASC)
);

