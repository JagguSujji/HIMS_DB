CREATE TABLE [dbo].[EmployeeWorkGroup] (
    [EmployeeWorkGroupId] BIGINT IDENTITY (1, 1) NOT NULL,
    [EmployeeId]          BIGINT NOT NULL,
    [WorkGroupId]         INT    NOT NULL,
    [EffectiveFrom]       DATE   NOT NULL,
    [EffectiveTo]         DATE   NULL,
    [IsActive]            BIT    DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([EmployeeWorkGroupId] ASC),
    CONSTRAINT [FK_EmployeeWorkGroup_Employee] FOREIGN KEY ([EmployeeId]) REFERENCES [dbo].[Employee] ([EmployeeId]),
    CONSTRAINT [FK_EmployeeWorkGroup_WorkGroup] FOREIGN KEY ([WorkGroupId]) REFERENCES [dbo].[WorkGroup] ([WorkGroupId])
);

