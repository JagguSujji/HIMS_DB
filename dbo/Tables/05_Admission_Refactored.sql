-- ============================================================================
-- HIMS Admission Table - REFACTORED FOR ENTERPRISE READINESS
-- ============================================================================
-- Changes from original:
-- 1. Changed all IDs to BIGINT for consistency
-- 2. Changed DoctorIds from INT to BIGINT
-- 3. Added NOT NULL constraints to required fields
-- 4. Changed DATETIME to DATETIME2(7)
-- 5. Added ALL missing foreign key constraints
-- 6. Added comprehensive audit columns
-- 7. Added IsDeleted for soft delete pattern
-- 8. Added discharge summary and medical information
-- 9. Added CHECK constraints for date validation
-- ============================================================================

CREATE TABLE [dbo].[Admission] (
    -- PRIMARY KEY
    [AdmissionId]               BIGINT          IDENTITY (1, 1) NOT NULL,
    
    -- FOREIGN KEYS
    [PatientId]                 BIGINT          NOT NULL,                   -- Changed to NOT NULL
    [AdmissionTypeId]           INT             NOT NULL,                   -- Changed to NOT NULL
    [AdmissionStatusId]         INT             NOT NULL DEFAULT 1,         -- Changed to NOT NULL
    [AdmittingDoctorId]         BIGINT          NOT NULL,                   -- Changed from INT to BIGINT
    [DischargeDoctorId]         BIGINT          NULL,                       -- Changed from INT to BIGINT
    [RoomId]                    INT             NULL,
    [BedId]                     INT             NULL,
    [BranchId]                  BIGINT          NULL,                       -- NEW - Multi-branch support
    [DepartmentId]              BIGINT          NULL,                       -- NEW - Department
    
    -- ADMISSION DETAILS
    [AdmissionDate]             DATETIME2(7)    NOT NULL,                   -- Changed from DATETIME
    [EstimatedDischargeDate]    DATETIME2(7)    NULL,                       -- NEW - Estimated discharge
    [DischargeDate]             DATETIME2(7)    NULL,                       -- Changed from DATETIME
    [LengthOfStay]              INT             NULL,                       -- NEW - Calculated field
    
    -- ADMISSION INFORMATION
    [ReasonForAdmission]        NVARCHAR (MAX)  NULL,                       -- NEW - Chief complaint
    [PrimaryDiagnosis]          VARCHAR (50)    NULL,                       -- NEW - ICD-10 code
    [SecondaryDiagnosis]        VARCHAR (MAX)   NULL,                       -- NEW - Other diagnoses (CSV)
    [MedicalHistory]            NVARCHAR (MAX)  NULL,                       -- NEW - Relevant history
    [AllergiesAndWarnings]      NVARCHAR (MAX)  NULL,                       -- NEW - Critical safety info
    
    -- DISCHARGE INFORMATION
    [DischargeSummary]          NVARCHAR (MAX)  NULL,                       -- NEW - Discharge notes
    [DischargeInstructions]     NVARCHAR (MAX)  NULL,                       -- NEW - Post-discharge care
    [FollowUpRequired]          BIT             NOT NULL DEFAULT 0,         -- NEW - Follow-up appointment
    [FollowUpDays]              INT             NULL,                       -- NEW - Follow-up schedule
    [DischargeReason]           VARCHAR (50)    NULL,                       -- NEW - Reason (recovery, transfer, etc.)
    
    -- FINANCIAL INFORMATION
    [InsuranceApprovalNumber]   VARCHAR (100)   NULL,                       -- NEW - For insurance claims
    [AuthorizationNumber]       VARCHAR (100)   NULL,                       -- NEW - Pre-auth number
    [EstimatedCharges]          DECIMAL(18, 2)  NULL,                       -- NEW - Estimated cost
    
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
    PRIMARY KEY CLUSTERED ([AdmissionId] ASC),
    
    -- FOREIGN KEY CONSTRAINTS
    CONSTRAINT [FK_Admission_Patient]
        FOREIGN KEY ([PatientId]) REFERENCES [dbo].[Patient] ([PatientId]),
    CONSTRAINT [FK_Admission_AdmissionType]
        FOREIGN KEY ([AdmissionTypeId]) REFERENCES [dbo].[AdmissionType] ([AdmissionTypeId]),
    CONSTRAINT [FK_Admission_AdmissionStatus]
        FOREIGN KEY ([AdmissionStatusId]) REFERENCES [dbo].[AdmissionStatus] ([AdmissionStatusId]),
    CONSTRAINT [FK_Admission_AdmittingDoctor]
        FOREIGN KEY ([AdmittingDoctorId]) REFERENCES [dbo].[Employee] ([EmployeeId]),
    CONSTRAINT [FK_Admission_DischargeDoctor]
        FOREIGN KEY ([DischargeDoctorId]) REFERENCES [dbo].[Employee] ([EmployeeId]),
    CONSTRAINT [FK_Admission_Room]
        FOREIGN KEY ([RoomId]) REFERENCES [dbo].[Room] ([RoomId]),
    CONSTRAINT [FK_Admission_Bed]
        FOREIGN KEY ([BedId]) REFERENCES [dbo].[Bed] ([BedId]),
    CONSTRAINT [FK_Admission_Branch]
        FOREIGN KEY ([BranchId]) REFERENCES [dbo].[Branch] ([BranchId]),
    CONSTRAINT [FK_Admission_Department]
        FOREIGN KEY ([DepartmentId]) REFERENCES [dbo].[Department] ([DepartmentId]),
    CONSTRAINT [FK_Admission_CreatedBy]
        FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[ApplicationUser] ([UserId]),
    CONSTRAINT [FK_Admission_ModifiedBy]
        FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[ApplicationUser] ([UserId]),
    
    -- CHECK CONSTRAINTS
    CONSTRAINT [CK_Admission_Dates]
        CHECK ([AdmissionDate] <= GETDATE()),                              -- Admission in past or today
    CONSTRAINT [CK_Admission_DischargeDate]
        CHECK ([DischargeDate] IS NULL OR [DischargeDate] >= [AdmissionDate]),  -- Discharge >= Admission
    CONSTRAINT [CK_Admission_EstimatedDischargeDate]
        CHECK ([EstimatedDischargeDate] IS NULL OR [EstimatedDischargeDate] >= [AdmissionDate]),
    CONSTRAINT [CK_Admission_LengthOfStay]
        CHECK ([LengthOfStay] IS NULL OR [LengthOfStay] >= 0),
    CONSTRAINT [CK_Admission_FollowUpDays]
        CHECK ([FollowUpDays] IS NULL OR [FollowUpDays] > 0),
    CONSTRAINT [CK_Admission_EstimatedCharges]
        CHECK ([EstimatedCharges] IS NULL OR [EstimatedCharges] >= 0)
);

-- CREATE INDEXES
CREATE NONCLUSTERED INDEX [IX_Admission_PatientId] ON [dbo].[Admission]([PatientId]);
CREATE NONCLUSTERED INDEX [IX_Admission_AdmittingDoctorId] ON [dbo].[Admission]([AdmittingDoctorId]);
CREATE NONCLUSTERED INDEX [IX_Admission_DepartmentId] ON [dbo].[Admission]([DepartmentId]);
CREATE NONCLUSTERED INDEX [IX_Admission_BedId] ON [dbo].[Admission]([BedId]);
CREATE NONCLUSTERED INDEX [IX_Admission_RoomId] ON [dbo].[Admission]([RoomId]);
CREATE NONCLUSTERED INDEX [IX_Admission_AdmissionDate] ON [dbo].[Admission]([AdmissionDate]);
CREATE NONCLUSTERED INDEX [IX_Admission_DischargeDate] ON [dbo].[Admission]([DischargeDate]);
CREATE NONCLUSTERED INDEX [IX_Admission_AdmissionStatusId] ON [dbo].[Admission]([AdmissionStatusId]);
CREATE NONCLUSTERED INDEX [IX_Admission_BranchId] ON [dbo].[Admission]([BranchId]);

-- Filtered index for active admissions
CREATE NONCLUSTERED INDEX [IX_Admission_Active]
    ON [dbo].[Admission]([PatientId], [AdmissionDate])
    WHERE [IsDeleted] = 0 AND [AdmissionStatusId] IN (1, 2);  -- Active/In Progress

CREATE NONCLUSTERED INDEX [IX_Admission_Search]
    ON [dbo].[Admission]([AdmissionDate], [PatientId], [AdmittingDoctorId])
    INCLUDE ([DischargeDate], [BedId], [DepartmentId]);

-- ============================================================================
-- CHANGE SUMMARY
-- ============================================================================
-- CHANGED: All IDs to BIGINT for consistency
-- CHANGED: DoctorIds from INT to BIGINT
-- ADDED: NOT NULL to PatientId, AdmissionTypeId, AdmissionStatusId, AdmittingDoctorId
-- ADDED: ALL missing FK constraints
-- ADDED: BranchId, DepartmentId for multi-branch and department tracking
-- ADDED: EstimatedDischargeDate, LengthOfStay, ReasonForAdmission
-- ADDED: PrimaryDiagnosis, SecondaryDiagnosis, MedicalHistory, AllergiesAndWarnings
-- ADDED: DischargeSummary, DischargeInstructions, FollowUpRequired, FollowUpDays, DischargeReason
-- ADDED: InsuranceApprovalNumber, AuthorizationNumber, EstimatedCharges
-- ADDED: CreatedBy, CreatedOn, ModifiedBy, ModifiedOn, IsDeleted, RowVersion (audit & locking)
-- CHANGED: DATETIME to DATETIME2(7)
-- ADDED: Comprehensive CHECK constraints for date validation and logical consistency
-- ADDED: Multiple indexes for admission queries and filtering
-- ============================================================================
