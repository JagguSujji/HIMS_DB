CREATE TABLE [dbo].[BloodIssueStatus] (
    [BloodIssueStatusId] INT            IDENTITY (1, 1) NOT NULL,
    [StatusCode]         VARCHAR (20)   NULL,
    [StatusName]         NVARCHAR (100) NULL,
    [IsClosed]           BIT            DEFAULT ((0)) NULL,
    [IsActive]           BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([BloodIssueStatusId] ASC)
);

