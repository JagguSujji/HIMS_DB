CREATE TABLE [dbo].[EmployeeLeave] (
    [EmployeeLeaveId] BIGINT         IDENTITY (1, 1) NOT NULL,
    [EmployeeId]      BIGINT         NOT NULL,
    [LeaveTypeId]     INT            NOT NULL,
    [FromDate]        DATE           NOT NULL,
    [ToDate]          DATE           NOT NULL,
    [TotalDays]       DECIMAL (5, 2) NULL,
    [LeaveReason]     NVARCHAR (500) NULL,
    [ApprovedBy]      BIGINT         NULL,
    [ApprovedOn]      DATETIME2 (7)  NULL,
    [LeaveStatus]     VARCHAR (20)   NULL,
    [CreatedOn]       DATETIME2 (7)  DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([EmployeeLeaveId] ASC),
    CONSTRAINT [FK_EmployeeLeave_Employee] FOREIGN KEY ([EmployeeId]) REFERENCES [dbo].[Employee] ([EmployeeId]),
    CONSTRAINT [FK_EmployeeLeave_Type] FOREIGN KEY ([LeaveTypeId]) REFERENCES [dbo].[LeaveType] ([LeaveTypeId])
);

