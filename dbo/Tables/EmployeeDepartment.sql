CREATE TABLE [dbo].[EmployeeDepartment] (
    [EmployeeDepartmentId] BIGINT IDENTITY (1, 1) NOT NULL,
    [EmployeeId]           BIGINT NULL,
    [DepartmentId]         INT    NULL,
    [IsPrimaryDepartment]  BIT    DEFAULT ((0)) NULL,
    [EffectiveFrom]        DATE   NULL,
    [EffectiveTo]          DATE   NULL,
    PRIMARY KEY CLUSTERED ([EmployeeDepartmentId] ASC),
    CONSTRAINT [FK_ED_Department] FOREIGN KEY ([DepartmentId]) REFERENCES [dbo].[Department] ([DepartmentId]),
    CONSTRAINT [FK_ED_Employee] FOREIGN KEY ([EmployeeId]) REFERENCES [dbo].[Employee] ([EmployeeId])
);

