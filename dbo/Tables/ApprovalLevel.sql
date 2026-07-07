CREATE TABLE [dbo].[ApprovalLevel] (
    [ApprovalLevelId]   INT             IDENTITY (1, 1) NOT NULL,
    [ApprovalLevelCode] VARCHAR (20)    NULL,
    [ApprovalLevelName] NVARCHAR (100)  NULL,
    [SequenceNo]        INT             NULL,
    [MinimumAmount]     DECIMAL (18, 2) NULL,
    [MaximumAmount]     DECIMAL (18, 2) NULL,
    [IsActive]          BIT             DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([ApprovalLevelId] ASC)
);

