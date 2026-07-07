CREATE TABLE [dbo].[EmployeeReporting] (
    [EmployeeReportingId] BIGINT IDENTITY (1, 1) NOT NULL,
    [EmployeeId]          BIGINT NOT NULL,
    [ReportingManagerId]  BIGINT NOT NULL,
    [EffectiveFrom]       DATE   NOT NULL,
    [EffectiveTo]         DATE   NULL,
    [IsPrimaryManager]    BIT    DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([EmployeeReportingId] ASC),
    CONSTRAINT [FK_ER_Employee] FOREIGN KEY ([EmployeeId]) REFERENCES [dbo].[Employee] ([EmployeeId]),
    CONSTRAINT [FK_ER_Manager] FOREIGN KEY ([ReportingManagerId]) REFERENCES [dbo].[Employee] ([EmployeeId])
);

