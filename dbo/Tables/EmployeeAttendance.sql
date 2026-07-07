CREATE TABLE [dbo].[EmployeeAttendance] (
    [EmployeeAttendanceId] BIGINT         IDENTITY (1, 1) NOT NULL,
    [EmployeeId]           BIGINT         NOT NULL,
    [AttendanceDate]       DATE           NOT NULL,
    [ShiftTypeId]          INT            NOT NULL,
    [AttendanceStatusId]   INT            NOT NULL,
    [CheckInTime]          DATETIME2 (7)  NULL,
    [CheckOutTime]         DATETIME2 (7)  NULL,
    [WorkedHours]          DECIMAL (5, 2) NULL,
    [OvertimeHours]        DECIMAL (5, 2) NULL,
    [Remarks]              NVARCHAR (300) NULL,
    [CreatedOn]            DATETIME2 (7)  DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([EmployeeAttendanceId] ASC),
    CONSTRAINT [FK_Attendance_Employee] FOREIGN KEY ([EmployeeId]) REFERENCES [dbo].[Employee] ([EmployeeId]),
    CONSTRAINT [FK_Attendance_Shift] FOREIGN KEY ([ShiftTypeId]) REFERENCES [dbo].[ShiftType] ([ShiftTypeId]),
    CONSTRAINT [FK_Attendance_Status] FOREIGN KEY ([AttendanceStatusId]) REFERENCES [dbo].[AttendanceStatus] ([AttendanceStatusId])
);

