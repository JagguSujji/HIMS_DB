CREATE TABLE [dbo].[ApprovalStatus] (
    [ApprovalStatusId]   INT            IDENTITY (1, 1) NOT NULL,
    [ApprovalStatusCode] VARCHAR (20)   NULL,
    [ApprovalStatusName] NVARCHAR (100) NULL,
    [DisplayOrder]       INT            NULL,
    [IsActive]           BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([ApprovalStatusId] ASC)
);

