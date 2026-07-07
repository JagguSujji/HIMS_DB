CREATE TABLE [dbo].[BranchDepartment] (
    [BranchDepartmentId] INT           IDENTITY (1, 1) NOT NULL,
    [BranchId]           INT           NOT NULL,
    [DepartmentId]       INT           NOT NULL,
    [IsActive]           BIT           DEFAULT ((1)) NOT NULL,
    [CreatedOn]          DATETIME2 (7) DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([BranchDepartmentId] ASC),
    CONSTRAINT [FK_BranchDepartment_Branch] FOREIGN KEY ([BranchId]) REFERENCES [dbo].[Branch] ([BranchId]),
    CONSTRAINT [FK_BranchDepartment_Department] FOREIGN KEY ([DepartmentId]) REFERENCES [dbo].[Department] ([DepartmentId]),
    CONSTRAINT [UQ_BranchDepartment] UNIQUE NONCLUSTERED ([BranchId] ASC, [DepartmentId] ASC)
);

