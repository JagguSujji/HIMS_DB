CREATE TABLE [dbo].[WorkflowStatus] (
    [WorkflowStatusId]   INT            IDENTITY (1, 1) NOT NULL,
    [WorkflowStatusCode] VARCHAR (20)   NULL,
    [WorkflowStatusName] NVARCHAR (100) NULL,
    [DisplayOrder]       INT            NULL,
    [IsActive]           BIT            DEFAULT ((1)) NULL,
    [ModuleName]         VARCHAR (50)   NULL,
    PRIMARY KEY CLUSTERED ([WorkflowStatusId] ASC)
);

