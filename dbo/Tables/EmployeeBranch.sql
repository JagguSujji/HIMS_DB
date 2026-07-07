CREATE TABLE [dbo].[EmployeeBranch] (
    [EmployeeBranchId] BIGINT IDENTITY (1, 1) NOT NULL,
    [EmployeeId]       BIGINT NULL,
    [BranchId]         INT    NULL,
    [IsPrimaryBranch]  BIT    DEFAULT ((0)) NULL,
    [EffectiveFrom]    DATE   NULL,
    [EffectiveTo]      DATE   NULL,
    PRIMARY KEY CLUSTERED ([EmployeeBranchId] ASC),
    CONSTRAINT [FK_EB_Branch] FOREIGN KEY ([BranchId]) REFERENCES [dbo].[Branch] ([BranchId]),
    CONSTRAINT [FK_EB_Employee] FOREIGN KEY ([EmployeeId]) REFERENCES [dbo].[Employee] ([EmployeeId])
);

