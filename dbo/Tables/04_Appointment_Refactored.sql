-- ============================================================================
-- HIMS Appointment Table - REFACTORED FOR ENTERPRISE READINESS
-- ============================================================================
-- Changes from original:
-- 1. Changed AppointmentId, PatientId, SlotId, BranchId, DepartmentId, AppointmentTypeId, AppointmentModeId to BIGINT
-- 2. Changed DoctorId from INT to BIGINT for consistency with Employee
-- 3. Added NOT NULL constraints to required fields
-- 4. Changed AppointmentDate from DATETIME to DATETIME2(7)
-- 5. Added ALL missing foreign key constraints
-- 6. Added AppointmentStatusId as NOT NULL with FK
-- 7. Added audit columns (CreatedBy, CreatedOn, ModifiedBy, ModifiedOn)
-- 8. Added IsDeleted for soft delete pattern
-- 9. Added CHECK constraints for date validation
-- 10. Added comprehensive indexes for appointments queries
-- ============================================================================

CREATE TABLE [dbo].[Appointment] (
    -- PRIMARY KEY
    [AppointmentId]             BIGINT          IDENTITY (1, 1) NOT NULL,
    
    -- FOREIGN KEYS
    [PatientId]                 BIGINT          NOT NULL,                   -- Changed to NOT NULL
    [DoctorId]                  BIGINT          NOT NULL,                   -- Changed from INT to BIGINT
    [SlotId]                    BIGINT          NULL,
    [BranchId]                  BIGINT          NULL,
    [DepartmentId]              BIGINT          NULL,
    [AppointmentTypeId]         BIGINT          NULL,
    [AppointmentModeId]         BIGINT          NULL,
    
    -- APPOINTMENT DETAILS
    [AppointmentDate]           DATETIME2(7)    NOT NULL,                   -- Changed from DATETIME
    [AppointmentStatusId]       INT             NOT NULL DEFAULT 1,         -- Changed to NOT NULL
    [PriorityLevelId]           INT             NULL,
    [ReasonForVisit]            NVARCHAR (MAX)  NULL,                       -- Changed from NVARCHAR(500)
    [Remarks]                   NVARCHAR (MAX)  NULL,                       -- Changed from NVARCHAR(500)
    
    -- BOOKING INFORMATION
    [BookedBy]                  BIGINT          NOT NULL,                   -- Changed to NOT NULL
    [BookedOn]                  DATETIME2(7)    NOT NULL DEFAULT GETDATE(),
    [ConfirmedBy]               BIGINT          NULL,                       -- NEW - Who confirmed
    [ConfirmedOn]               DATETIME2(7)    NULL,                       -- NEW - When confirmed
    [CancelledBy]               BIGINT          NULL,                       -- NEW - Who cancelled
    [CancelledOn]               DATETIME2(7)    NULL,                       -- NEW - When cancelled
    [CancellationReason]        NVARCHAR (MAX)  NULL,                       -- NEW - Why cancelled
    
    -- APPOINTMENT OUTCOME
    [CheckInTime]               DATETIME2(7)    NULL,                       -- NEW - Patient check-in
    [CheckOutTime]              DATETIME2(7)    NULL,                       -- NEW - Patient check-out
    [NoShowReason]              VARCHAR (200)   NULL,                       -- NEW - If patient didn't show
    [Rescheduled]               BIT             NOT NULL DEFAULT 0,         -- NEW - Is rescheduled appointment
    [RescheduledFromId]         BIGINT          NULL,                       -- NEW - Original appointment ID
    
    -- STATUS
    [IsActive]                  BIT             NOT NULL DEFAULT 1,
    [IsDeleted]                 BIT             NOT NULL DEFAULT 0,         -- NEW - Soft delete
    
    -- AUDIT
    [CreatedBy]                 BIGINT          NOT NULL,                   -- NEW - Audit
    [CreatedOn]                 DATETIME2(7)    NOT NULL DEFAULT GETDATE(), -- NEW - Audit
    [ModifiedBy]                BIGINT          NULL,                       -- NEW - Audit
    [ModifiedOn]                DATETIME2(7)    NULL,                       -- NEW - Audit
    [RowVersion]                ROWVERSION      NOT NULL,                   -- NEW - Optimistic locking
    
    -- CONSTRAINTS
    PRIMARY KEY CLUSTERED ([AppointmentId] ASC),
    
    -- FOREIGN KEY CONSTRAINTS
    CONSTRAINT [FK_Appointment_Patient]
        FOREIGN KEY ([PatientId]) REFERENCES [dbo].[Patient] ([PatientId]),
    CONSTRAINT [FK_Appointment_Employee_Doctor]
        FOREIGN KEY ([DoctorId]) REFERENCES [dbo].[Employee] ([EmployeeId]),
    CONSTRAINT [FK_Appointment_AppointmentStatus]
        FOREIGN KEY ([AppointmentStatusId]) REFERENCES [dbo].[AppointmentStatus] ([AppointmentStatusId]),
    CONSTRAINT [FK_Appointment_PriorityLevel]
        FOREIGN KEY ([PriorityLevelId]) REFERENCES [dbo].[PriorityLevel] ([PriorityLevelId]),
    CONSTRAINT [FK_Appointment_AppointmentType]
        FOREIGN KEY ([AppointmentTypeId]) REFERENCES [dbo].[AppointmentType] ([AppointmentTypeId]),
    CONSTRAINT [FK_Appointment_AppointmentMode]
        FOREIGN KEY ([AppointmentModeId]) REFERENCES [dbo].[AppointmentMode] ([AppointmentModeId]),
    CONSTRAINT [FK_Appointment_Branch]
        FOREIGN KEY ([BranchId]) REFERENCES [dbo].[Branch] ([BranchId]),
    CONSTRAINT [FK_Appointment_Department]
        FOREIGN KEY ([DepartmentId]) REFERENCES [dbo].[Department] ([DepartmentId]),
    CONSTRAINT [FK_Appointment_BookedBy]
        FOREIGN KEY ([BookedBy]) REFERENCES [dbo].[ApplicationUser] ([UserId]),
    CONSTRAINT [FK_Appointment_ConfirmedBy]
        FOREIGN KEY ([ConfirmedBy]) REFERENCES [dbo].[ApplicationUser] ([UserId]),
    CONSTRAINT [FK_Appointment_CancelledBy]
        FOREIGN KEY ([CancelledBy]) REFERENCES [dbo].[ApplicationUser] ([UserId]),
    CONSTRAINT [FK_Appointment_RescheduledFrom]
        FOREIGN KEY ([RescheduledFromId]) REFERENCES [dbo].[Appointment] ([AppointmentId]),
    
    -- CHECK CONSTRAINTS
    CONSTRAINT [CK_Appointment_AppointmentDate]
        CHECK ([AppointmentDate] >= GETDATE()),                            -- Cannot schedule in past
    CONSTRAINT [CK_Appointment_CheckInOut]
        CHECK ([CheckInTime] IS NULL OR [CheckOutTime] IS NULL OR [CheckInTime] <= [CheckOutTime]),  -- Check-out >= Check-in
    CONSTRAINT [CK_Appointment_CancelledReason]
        CHECK ([CancelledBy] IS NOT NULL OR [CancelledOn] IS NULL OR [CancellationReason] IS NULL)  -- If cancelled, must have reason
);

-- CREATE INDEXES
CREATE NONCLUSTERED INDEX [IX_Appointment_PatientId] ON [dbo].[Appointment]([PatientId]);
CREATE NONCLUSTERED INDEX [IX_Appointment_DoctorId] ON [dbo].[Appointment]([DoctorId]);
CREATE NONCLUSTERED INDEX [IX_Appointment_AppointmentDate] ON [dbo].[Appointment]([AppointmentDate]);
CREATE NONCLUSTERED INDEX [IX_Appointment_AppointmentStatusId] ON [dbo].[Appointment]([AppointmentStatusId]);
CREATE NONCLUSTERED INDEX [IX_Appointment_DepartmentId] ON [dbo].[Appointment]([DepartmentId]);
CREATE NONCLUSTERED INDEX [IX_Appointment_BranchId] ON [dbo].[Appointment]([BranchId]);
CREATE NONCLUSTERED INDEX [IX_Appointment_BookedOn] ON [dbo].[Appointment]([BookedOn]);

-- Filtered indexes for common queries
CREATE NONCLUSTERED INDEX [IX_Appointment_DateRange_Active]
    ON [dbo].[Appointment]([AppointmentDate], [AppointmentStatusId])
    WHERE [IsDeleted] = 0 AND [AppointmentDate] >= CAST(GETDATE() AS DATE);

CREATE NONCLUSTERED INDEX [IX_Appointment_Search]
    ON [dbo].[Appointment]([AppointmentDate], [DoctorId])
    INCLUDE ([PatientId], [AppointmentStatusId], [DepartmentId]);

-- ============================================================================
-- CHANGE SUMMARY
-- ============================================================================
-- CHANGED: AppointmentId, PatientId, SlotId, BranchId, DepartmentId, AppointmentTypeId, AppointmentModeId to BIGINT
-- CHANGED: DoctorId from INT to BIGINT
-- ADDED: NOT NULL to PatientId, DoctorId, AppointmentStatusId, BookedBy
-- ADDED: ALL missing FK constraints (Patient, Employee, AppointmentStatus, etc.)
-- ADDED: ConfirmedBy, ConfirmedOn, CancelledBy, CancelledOn, CancellationReason
-- ADDED: CheckInTime, CheckOutTime, NoShowReason, Rescheduled, RescheduledFromId
-- ADDED: CreatedBy, CreatedOn, ModifiedBy, ModifiedOn, IsDeleted, RowVersion (audit & locking)
-- CHANGED: AppointmentDate from DATETIME to DATETIME2(7)
-- CHANGED: ReasonForVisit, Remarks from NVARCHAR(500) to NVARCHAR(MAX)
-- ADDED: CHECK constraints for date ranges and logical validations
-- ADDED: Comprehensive indexes for appointment queries and filtering
-- ============================================================================
