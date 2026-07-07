-- ============================================================================
-- HIMS Encounter Table - REFACTORED FOR ENTERPRISE READINESS
-- ============================================================================
-- Changes from original:
-- 1. Changed all IDs to BIGINT for consistency
-- 2. Changed ProviderId from BIGINT to match Employee.EmployeeId type
-- 3. Added NOT NULL constraints to required fields
-- 4. Changed DATETIME to DATETIME2(7)
-- 5. Added ALL missing foreign key constraints
-- 6. Added comprehensive audit columns
-- 7. Added encounter-specific clinical information
-- ============================================================================

CREATE TABLE [dbo].[Encounter] (
    -- PRIMARY KEY
    [EncounterId]               BIGINT          IDENTITY (1, 1) NOT NULL,
    
    -- FOREIGN KEYS
    [VisitId]                   BIGINT          NOT NULL,                   -- Changed to NOT NULL
    [PatientId]                 BIGINT          NOT NULL,                   -- NEW - Direct link to patient
    [ProviderId]                BIGINT          NOT NULL,                   -- Changed from BIGINT (now NOT NULL)
    [DepartmentId]              BIGINT          NULL,                       -- NEW - Department
    [LocationId]                BIGINT          NULL,
    [EncounterStatusId]         INT             NOT NULL DEFAULT 1,         -- NEW - Status tracking
    [EncounterTypeId]           INT             NULL,                       -- NEW - Type reference
    
    -- ENCOUNTER DETAILS
    [EncounterType]             VARCHAR (50)    NOT NULL,                   -- Consultation, procedure, etc.
    [StartTime]                 DATETIME2(7)    NOT NULL,                   -- Changed from DATETIME
    [EndTime]                   DATETIME2(7)    NULL,                       -- Changed from DATETIME
    [DurationMinutes]           INT             NULL,                       -- NEW - Calculated
    [EncounterStatus]           VARCHAR (30)    NOT NULL DEFAULT 'ACTIVE',
    
    -- CLINICAL INFORMATION
    [ChiefComplaint]            NVARCHAR (MAX)  NULL,                       -- NEW - Chief complaint
    [PresentingIllness]         NVARCHAR (MAX)  NULL,                       -- NEW - History of present illness
    [PhysicalExamination]       NVARCHAR (MAX)  NULL,                       -- NEW - Physical exam findings
    [AssessmentDiagnosis]       NVARCHAR (MAX)  NULL,                       -- NEW - Clinical assessment
    [DiagnosisICD10]            VARCHAR (50)    NULL,                       -- NEW - ICD-10 codes
    [Plan]                      NVARCHAR (MAX)  NULL,                       -- NEW - Treatment plan
    [NotesSummary]              NVARCHAR (MAX)  NULL,                       -- Clinical notes
    
    -- CLINICAL FINDINGS
    [Vitals]                    NVARCHAR (MAX)  NULL,                       -- NEW - Blood pressure, temp, etc. (JSON)
    [LabResults]                NVARCHAR (MAX)  NULL,                       -- NEW - Lab test results (JSON)
    [Imaging]                   NVARCHAR (MAX)  NULL,                       -- NEW - Imaging findings
    
    -- CONSULTATION DETAILS
    [ConsultationType]          VARCHAR (50)    NULL,                       -- NEW - Follow-up, Initial, etc.
    [IsFollowUp]                BIT             NOT NULL DEFAULT 0,         -- NEW - Is this follow-up
    [FollowUpAfterDays]         INT             NULL,                       -- NEW - Follow-up schedule
    
    -- REFERRAL INFORMATION
    [ReferredTo]                BIGINT          NULL,                       -- NEW - Referred to provider
    [ReferralReason]            NVARCHAR (MAX)  NULL,                       -- NEW - Reason for referral
    [ReferralDate]              DATETIME2(7)    NULL,                       -- NEW - When referred
    
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
    PRIMARY KEY CLUSTERED ([EncounterId] ASC),
    
    CONSTRAINT [FK_Encounter_Visit]
        FOREIGN KEY ([VisitId]) REFERENCES [dbo].[Visit] ([VisitId]),
    CONSTRAINT [FK_Encounter_Patient]
        FOREIGN KEY ([PatientId]) REFERENCES [dbo].[Patient] ([PatientId]),
    CONSTRAINT [FK_Encounter_Provider]
        FOREIGN KEY ([ProviderId]) REFERENCES [dbo].[Employee] ([EmployeeId]),
    CONSTRAINT [FK_Encounter_Department]
        FOREIGN KEY ([DepartmentId]) REFERENCES [dbo].[Department] ([DepartmentId]),
    CONSTRAINT [FK_Encounter_EncounterStatus]
        FOREIGN KEY ([EncounterStatusId]) REFERENCES [dbo].[EncounterStatus] ([EncounterStatusId]),
    CONSTRAINT [FK_Encounter_EncounterType]
        FOREIGN KEY ([EncounterTypeId]) REFERENCES [dbo].[EncounterType] ([EncounterTypeId]),
    CONSTRAINT [FK_Encounter_ReferredTo]
        FOREIGN KEY ([ReferredTo]) REFERENCES [dbo].[Employee] ([EmployeeId]),
    CONSTRAINT [FK_Encounter_CreatedBy]
        FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[ApplicationUser] ([UserId]),
    CONSTRAINT [FK_Encounter_ModifiedBy]
        FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[ApplicationUser] ([UserId]),
    
    -- CHECK CONSTRAINTS
    CONSTRAINT [CK_Encounter_Times]
        CHECK ([EndTime] IS NULL OR [EndTime] >= [StartTime]),
    CONSTRAINT [CK_Encounter_DurationMinutes]
        CHECK ([DurationMinutes] IS NULL OR [DurationMinutes] >= 0),
    CONSTRAINT [CK_Encounter_FollowUpDays]
        CHECK ([FollowUpAfterDays] IS NULL OR [FollowUpAfterDays] > 0),
    CONSTRAINT [CK_Encounter_ReferralLogic]
        CHECK ([ReferredTo] IS NULL OR [ReferralReason] IS NOT NULL)
);

-- CREATE INDEXES
CREATE NONCLUSTERED INDEX [IX_Encounter_VisitId] ON [dbo].[Encounter]([VisitId]);
CREATE NONCLUSTERED INDEX [IX_Encounter_PatientId] ON [dbo].[Encounter]([PatientId]);
CREATE NONCLUSTERED INDEX [IX_Encounter_ProviderId] ON [dbo].[Encounter]([ProviderId]);
CREATE NONCLUSTERED INDEX [IX_Encounter_DepartmentId] ON [dbo].[Encounter]([DepartmentId]);
CREATE NONCLUSTERED INDEX [IX_Encounter_StartTime] ON [dbo].[Encounter]([StartTime]);
CREATE NONCLUSTERED INDEX [IX_Encounter_EncounterStatusId] ON [dbo].[Encounter]([EncounterStatusId]);

-- Filtered indexes
CREATE NONCLUSTERED INDEX [IX_Encounter_Active]
    ON [dbo].[Encounter]([PatientId], [StartTime])
    WHERE [IsDeleted] = 0 AND [EncounterStatus] IN ('ACTIVE', 'IN_PROGRESS');

CREATE NONCLUSTERED INDEX [IX_Encounter_Search]
    ON [dbo].[Encounter]([StartTime], [ProviderId], [PatientId])
    INCLUDE ([DepartmentId], [EncounterType]);

-- ============================================================================
-- CHANGE SUMMARY
-- ============================================================================
-- CHANGED: All IDs to BIGINT
-- ADDED: NOT NULL to VisitId, PatientId, ProviderId, EncounterType, StartTime
-- ADDED: PatientId (direct link), DepartmentId, EncounterStatusId, EncounterTypeId
-- ADDED: DurationMinutes, ChiefComplaint, PresentingIllness, PhysicalExamination
-- ADDED: AssessmentDiagnosis, DiagnosisICD10, Plan, Vitals, LabResults, Imaging
-- ADDED: ConsultationType, IsFollowUp, FollowUpAfterDays
-- ADDED: ReferredTo, ReferralReason, ReferralDate (referral tracking)
-- ADDED: CreatedBy, CreatedOn, ModifiedBy, ModifiedOn, IsDeleted, RowVersion (audit & locking)
-- ADDED: ALL missing FK constraints
-- CHANGED: DATETIME to DATETIME2(7)
-- ADDED: Comprehensive CHECK constraints
-- ADDED: Multiple indexes for encounter queries
-- ============================================================================
