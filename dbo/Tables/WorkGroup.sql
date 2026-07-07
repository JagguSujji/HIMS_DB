CREATE TABLE [dbo].[WorkGroup] (
    [WorkGroupId]   INT            IDENTITY (1, 1) NOT NULL,
    [WorkGroupCode] VARCHAR (20)   NOT NULL,
    [WorkGroupName] NVARCHAR (100) NOT NULL,
    [BranchId]      INT            NULL,
    [DepartmentId]  INT            NULL,
    [Description]   NVARCHAR (300) NULL,
    [IsActive]      BIT            DEFAULT ((1)) NOT NULL,
    [CreatedBy]     INT            NULL,
    [CreatedOn]     DATETIME2 (7)  DEFAULT (getdate()) NOT NULL,
    [ModifiedBy]    INT            NULL,
    [ModifiedOn]    DATETIME2 (7)  NULL,
    PRIMARY KEY CLUSTERED ([WorkGroupId] ASC),
    CONSTRAINT [FK_WorkGroup_Branch] FOREIGN KEY ([BranchId]) REFERENCES [dbo].[Branch] ([BranchId]),
    CONSTRAINT [FK_WorkGroup_Department] FOREIGN KEY ([DepartmentId]) REFERENCES [dbo].[Department] ([DepartmentId]),
    UNIQUE NONCLUSTERED ([WorkGroupCode] ASC)
);

