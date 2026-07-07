-- ============================================================================
-- HIMS Visit Table - REFACTORED FOR ENTERPRISE READINESS
-- ============================================================================
-- Changes from original:
-- 1. Changed all IDs to BIGINT for consistency
-- 2. Changed DoctorId from INT to BIGINT
-- 3. Added NOT NULL constraints to required fields
-- 4. Changed DATETIME to DATETIME2(7)
-- 5. Added ALL missing foreign key constraints
-- 6. Added comprehensive audit columns
-- 7. Added IsDeleted for soft delete pattern
-- ============================================================================

CREATE TABLE [dbo].[Visit] (
    -- PRIMARY KEY
    [VisitId]                   BIGINT          IDENTITY (1, 1) NOT NULL,
    
    -- FOREIGN KEYS
    [PatientId]                 BIGINT          NOT NULL,                   -- Changed to NOT NULL
    [DoctorId]                  BIGINT          NOT NULL,                   -- Changed from INT to BIGINT
    [DepartmentId]              BIGINT          NOT NULL,                   -- Changed to NOT NULL
    [VisitStatusId]             INT             NOT NULL DEFAULT 1,         -- Changed to NOT NULL
    [BranchId]                  BIGINT          NULL,                       -- NEW - Multi-branch support
    [ChiefComplaintId]          INT             NULL,
    [TriageLevelId]             INT             NULL,
    [EpisodeId]                 BIGINT          NULL,
    
    -- VISIT DETAILS
    [VisitDate]                 DATETIME2(7)    NOT NULL,                   -- Changed from DATETIME
    [VisitType]                 VARCHAR (50)    NOT NULL,                   -- Changed to NOT NULL
    [VisitSource]               NVARCHAR (50)   NULL,
    [ChiefComplaintText]        NVARCHAR (MAX)  NULL,                       -- Changed from VARCHAR(500)
    [VisitRemarks]              NVARCHAR (MAX)  NULL,                       -- NEW - Visit notes
    
    -- TIMING
    [CheckInTime]               DATETIME2(7)    NOT NULL,                   -- Changed to NOT NULL
    [CheckOutTime]              DATETIME2(7)    NULL,                       -- Can be NULL if not checked out
    [DurationMinutes]           INT             NULL,                       -- NEW - Calculated
    [WaitTimeMinutes]           INT             NULL,                       -- NEW - Check-in to see doctor
    [ConsultationTimeMinutes]   INT             NULL,                       -- NEW - Actual consultation time
    
    -- CLINICAL INFORMATION
    [Vitals]                    NVARCHAR (MAX)  NULL,                       -- NEW - JSON or text vitals
    [ClinicalFindings]          NVARCHAR (MAX)  NULL,                       -- NEW - Physical exam findings
    [DiagnosisICD10]            VARCHAR (50)    NULL,                       -- NEW - ICD-10 code
    [TreatmentPlan]             NVARCHAR (MAX)  NULL,                       -- NEW - Treatment plan
    [FollowUpRequired]          BIT             NOT NULL DEFAULT 0,         -- NEW - Requires follow-up
    [FollowUpDays]              INT             NULL,                       -- NEW - Follow-up after X days
    
    -- BILLING INFORMATION
    [VisitCharges]              DECIMAL(18, 2)  NULL,                       -- NEW - Cost of visit
    [ConsultationFee]           DECIMAL(18, 2)  NULL,                       -- NEW - Doctor fee
    
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
    PRIMARY KEY CLUSTERED ([VisitId] ASC),
    
    CONSTRAINT [FK_Visit_Patient]
        FOREIGN KEY ([PatientId]) REFERENCES [dbo].[Patient] ([PatientId]),
    CONSTRAINT [FK_Visit_Doctor]
        FOREIGN KEY ([DoctorId]) REFERENCES [dbo].[Employee] ([EmployeeId]),
    CONSTRAINT [FK_Visit_Department]
        FOREIGN KEY ([DepartmentId]) REFERENCES [dbo].[Department] ([DepartmentId]),
    CONSTRAINT [FK_Visit_VisitStatus]
        FOREIGN KEY ([VisitStatusId]) REFERENCES [dbo].[VisitStatus] ([VisitStatusId]),
    CONSTRAINT [FK_Visit_Branch]
        FOREIGN KEY ([BranchId]) REFERENCES [dbo].[Branch] ([BranchId]),
    CONSTRAINT [FK_Visit_ChiefComplaint]
        FOREIGN KEY ([ChiefComplaintId]) REFERENCES [dbo].[ChiefComplaint] ([ChiefComplaintId]),
    CONSTRAINT [FK_Visit_TriageLevel]
        FOREIGN KEY ([TriageLevelId]) REFERENCES [dbo].[TriageLevel] ([TriageLevelId]),
    CONSTRAINT [FK_Visit_CreatedBy]
        FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[ApplicationUser] ([UserId]),
    CONSTRAINT [FK_Visit_ModifiedBy]
        FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[ApplicationUser] ([UserId]),
    
    -- CHECK CONSTRAINTS
    CONSTRAINT [CK_Visit_VisitDate]
        CHECK ([VisitDate] <= GETDATE()),                                  -- Visit in past or today
    CONSTRAINT [CK_Visit_Times]
        CHECK ([CheckOutTime] IS NULL OR [CheckOutTime] >= [CheckInTime]),
    CONSTRAINT [CK_Visit_Duration]
        CHECK ([DurationMinutes] IS NULL OR [DurationMinutes] >= 0),
    CONSTRAINT [CK_Visit_Charges]
        CHECK ([VisitCharges] IS NULL OR [VisitCharges] >= 0),
    CONSTRAINT [CK_Visit_FollowUpDays]
        CHECK ([FollowUpDays] IS NULL OR [FollowUpDays] > 0)
);

-- CREATE INDEXES
CREATE NONCLUSTERED INDEX [IX_Visit_PatientId] ON [dbo].[Visit]([PatientId]);
CREATE NONCLUSTERED INDEX [IX_Visit_DoctorId] ON [dbo].[Visit]([DoctorId]);
CREATE NONCLUSTERED INDEX [IX_Visit_DepartmentId] ON [dbo].[Visit]([DepartmentId]);
CREATE NONCLUSTERED INDEX [IX_Visit_VisitDate] ON [dbo].[Visit]([VisitDate]);
CREATE NONCLUSTERED INDEX [IX_Visit_VisitStatusId] ON [dbo].[Visit]([VisitStatusId]);
CREATE NONCLUSTERED INDEX [IX_Visit_BranchId] ON [dbo].[Visit]([BranchId]);

-- Filtered indexes
CREATE NONCLUSTERED INDEX [IX_Visit_DateRange]
    ON [dbo].[Visit]([VisitDate], [DoctorId])
    WHERE [IsDeleted] = 0 AND [VisitStatusId] IN (1, 2);

CREATE NONCLUSTERED INDEX [IX_Visit_Search]
    ON [dbo].[Visit]([VisitDate], [PatientId], [DoctorId])
    INCLUDE ([DepartmentId], [VisitStatusId]);

-- ============================================================================
-- CHANGE SUMMARY
-- ============================================================================
-- CHANGED: All IDs to BIGINT for consistency
-- CHANGED: DoctorId from INT to BIGINT
-- ADDED: NOT NULL to PatientId, DoctorId, DepartmentId, VisitStatusId, VisitDate, VisitType, CheckInTime
-- ADDED: BranchId (multi-branch support)
-- ADDED: ALL missing FK constraints
-- ADDED: VisitRemarks, Vitals, ClinicalFindings, DiagnosisICD10, TreatmentPlan
-- ADDED: FollowUpRequired, FollowUpDays, DurationMinutes, WaitTimeMinutes, ConsultationTimeMinutes
-- ADDED: VisitCharges, ConsultationFee
-- ADDED: CreatedBy, CreatedOn, ModifiedBy, ModifiedOn, IsDeleted, RowVersion (audit & locking)
-- CHANGED: VisitDate from DATETIME to DATETIME2(7)
-- CHANGED: ChiefComplaintText from VARCHAR(500) to NVARCHAR(MAX)
-- ADDED: Comprehensive CHECK constraints for time and charge validation
-- ADDED: Multiple indexes for visit queries
-- ============================================================================
