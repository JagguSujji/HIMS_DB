-- ============================================================================
-- HIMS EncounterDiagnosis Table - ENHANCED FOR CLINICAL WORKFLOW
-- ============================================================================
-- Purpose: Link diagnoses to encounters with detailed clinical information
-- Tracks primary vs secondary diagnoses and diagnosis status
-- ============================================================================

CREATE TABLE [dbo].[EncounterDiagnosis] (
    -- PRIMARY KEY
    [EncounterDiagnosisId]      BIGINT         IDENTITY (1, 1) NOT NULL,
    
    -- FOREIGN KEYS
    [EncounterId]               BIGINT         NOT NULL,
    [PatientId]                 BIGINT         NOT NULL,                   -- NEW - Direct patient link
    [DiagnosisId]               BIGINT         NULL,                       -- FK to Diagnosis master
    [DiagnosisCodeId]           INT            NULL,                       -- FK to ICD-10 codes
    [DiagnosedBy]               BIGINT         NOT NULL,                   -- Doctor who diagnosed
    [ConfirmedBy]               BIGINT         NULL,                       -- Senior doctor who confirmed
    
    -- DIAGNOSIS INFORMATION
    [DiagnosisCode]             VARCHAR (20)   NOT NULL,                   -- ICD-10 code
    [DiagnosisDescription]      NVARCHAR (500) NOT NULL,                   -- Full diagnosis description
    [DiagnosisNotes]            NVARCHAR (MAX) NULL,                       -- Additional notes
    
    -- DIAGNOSIS CLASSIFICATION
    [IsPrimaryDiagnosis]        BIT            NOT NULL DEFAULT 0,         -- Main diagnosis?
    [DiagnosisSequence]         INT            NULL,                       -- Order of importance
    [DiagnosisStatus]           VARCHAR (50)   NOT NULL DEFAULT 'CONFIRMED', -- Confirmed/Suspected/Ruled Out
    [DiagnosisCertainty]        VARCHAR (50)   NULL,                       -- Definite/Probable/Possible
    [DiagnosisType]             VARCHAR (50)   NULL,                       -- NEW - Chief Complaint/Working/Final
    
    -- CLINICAL DETAILS
    [OnsetDate]                 DATE           NULL,                       -- When did it start
    [ResolutionDate]            DATE           NULL,                       -- When did it resolve
    [IsOngoing]                 BIT            NOT NULL DEFAULT 1,         -- Still ongoing?
    [SeverityLevel]             VARCHAR (50)   NULL,                       -- Mild/Moderate/Severe
    [ClinicalPresentation]      NVARCHAR (MAX) NULL,                       -- How it presented
    [ClinicalFindings]          NVARCHAR (MAX) NULL,                       -- Physical exam findings
    
    -- INVESTIGATION & CONFIRMATION
    [ConfirmationMethod]        VARCHAR (100)  NULL,                       -- Clinical/Lab/Imaging/Biopsy
    [LabTestsPerformed]         NVARCHAR (MAX) NULL,                       -- Which tests (JSON/CSV)
    [ImagingFindings]           NVARCHAR (MAX) NULL,                       -- Imaging results
    [BiopsyResults]             NVARCHAR (MAX) NULL,                       -- If biopsy done
    [OtherInvestigations]       NVARCHAR (MAX) NULL,                       -- Other confirmatory tests
    
    -- TREATMENT RELATED
    [TreatmentPlan]             NVARCHAR (MAX) NULL,                       -- Treatment planned
    [TreatmentOutcome]          VARCHAR (100)  NULL,                       -- Resolved/Improved/Stable/Worsened
    [ResponseToTreatment]       VARCHAR (200)  NULL,                       -- How patient responded
    [ComplicationsIfAny]        NVARCHAR (MAX) NULL,                       -- Complications developed
    
    -- REFERRAL & FOLLOW-UP
    [ReferredToSpecialist]      BIGINT         NULL,                       -- Referred to specialist
    [SpecializationRequired]    VARCHAR (100)  NULL,                       -- Which specialty
    [ReferralReasons]           NVARCHAR (MAX) NULL,                       -- Why referred
    [FollowUpRequired]          BIT            NOT NULL DEFAULT 1,         -- Needs follow-up
    [FollowUpPeriodDays]        INT            NULL,                       -- Follow-up in X days
    [FollowUpScheduledDate]     DATE           NULL,                       -- When scheduled
    
    -- COMORBIDITY TRACKING
    [IsComorbidity]             BIT            NOT NULL DEFAULT 0,         -- Is this a comorbid condition
    [RelatedDiagnoses]          NVARCHAR (MAX) NULL,                       -- Related diagnoses (CSV)
    [ContraindicatedDrugs]      NVARCHAR (MAX) NULL,                       -- Drugs to avoid
    
    -- STATUS & AUDIT
    [IsActive]                  BIT            NOT NULL DEFAULT 1,
    [IsDeleted]                 BIT            NOT NULL DEFAULT 0,
    [IsValidated]               BIT            NOT NULL DEFAULT 0,         -- Has been clinically validated
    [ValidatedBy]               BIGINT         NULL,                       -- Who validated
    [ValidatedOn]               DATETIME2(7)   NULL,                       -- When validated
    
    -- AUDIT TRAIL
    [CreatedBy]                 BIGINT         NOT NULL,
    [CreatedOn]                 DATETIME2(7)   NOT NULL DEFAULT GETDATE(),
    [ModifiedBy]                BIGINT         NULL,
    [ModifiedOn]                DATETIME2(7)   NULL,
    [RowVersion]                ROWVERSION     NOT NULL,
    
    -- CONSTRAINTS
    PRIMARY KEY CLUSTERED ([EncounterDiagnosisId] ASC),
    
    CONSTRAINT [FK_EncounterDiagnosis_Encounter]
        FOREIGN KEY ([EncounterId]) REFERENCES [dbo].[Encounter] ([EncounterId]),
    CONSTRAINT [FK_EncounterDiagnosis_Patient]
        FOREIGN KEY ([PatientId]) REFERENCES [dbo].[Patient] ([PatientId]),
    CONSTRAINT [FK_EncounterDiagnosis_DiagnosedBy]
        FOREIGN KEY ([DiagnosedBy]) REFERENCES [dbo].[Employee] ([EmployeeId]),
    CONSTRAINT [FK_EncounterDiagnosis_ConfirmedBy]
        FOREIGN KEY ([ConfirmedBy]) REFERENCES [dbo].[Employee] ([EmployeeId]),
    CONSTRAINT [FK_EncounterDiagnosis_ReferredToSpecialist]
        FOREIGN KEY ([ReferredToSpecialist]) REFERENCES [dbo].[Employee] ([EmployeeId]),
    CONSTRAINT [FK_EncounterDiagnosis_ValidatedBy]
        FOREIGN KEY ([ValidatedBy]) REFERENCES [dbo].[ApplicationUser] ([UserId]),
    CONSTRAINT [FK_EncounterDiagnosis_CreatedBy]
        FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[ApplicationUser] ([UserId]),
    CONSTRAINT [FK_EncounterDiagnosis_ModifiedBy]
        FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[ApplicationUser] ([UserId]),
    
    -- CHECK CONSTRAINTS
    CONSTRAINT [CK_EncounterDiagnosis_DiagnosisCode]
        CHECK (LEN([DiagnosisCode]) > 0),
    CONSTRAINT [CK_EncounterDiagnosis_Dates]
        CHECK ([OnsetDate] IS NULL OR [ResolutionDate] IS NULL OR [OnsetDate] <= [ResolutionDate]),
    CONSTRAINT [CK_EncounterDiagnosis_FollowUpLogic]
        CHECK ([FollowUpRequired] = 0 OR [FollowUpPeriodDays] IS NOT NULL),
    CONSTRAINT [CK_EncounterDiagnosis_ValidationLogic]
        CHECK ([IsValidated] = 0 OR [ValidatedBy] IS NOT NULL)
);

-- CREATE INDEXES
CREATE NONCLUSTERED INDEX [IX_EncounterDiagnosis_EncounterId]
    ON [dbo].[EncounterDiagnosis]([EncounterId])
    WHERE [IsDeleted] = 0;

CREATE NONCLUSTERED INDEX [IX_EncounterDiagnosis_PatientId]
    ON [dbo].[EncounterDiagnosis]([PatientId])
    WHERE [IsDeleted] = 0;

CREATE NONCLUSTERED INDEX [IX_EncounterDiagnosis_DiagnosisCode]
    ON [dbo].[EncounterDiagnosis]([DiagnosisCode])
    WHERE [IsDeleted] = 0;

CREATE NONCLUSTERED INDEX [IX_EncounterDiagnosis_DiagnosedBy]
    ON [dbo].[EncounterDiagnosis]([DiagnosedBy])
    WHERE [IsDeleted] = 0;

CREATE NONCLUSTERED INDEX [IX_EncounterDiagnosis_IsPrimaryDiagnosis]
    ON [dbo].[EncounterDiagnosis]([EncounterId], [IsPrimaryDiagnosis])
    WHERE [IsDeleted] = 0 AND [IsPrimaryDiagnosis] = 1;

-- Filtered index for pending follow-ups
CREATE NONCLUSTERED INDEX [IX_EncounterDiagnosis_FollowUpPending]
    ON [dbo].[EncounterDiagnosis]([PatientId], [FollowUpScheduledDate])
    WHERE [IsDeleted] = 0 AND [FollowUpRequired] = 1 AND [FollowUpScheduledDate] IS NOT NULL;

-- ============================================================================
-- CHANGE SUMMARY
-- ============================================================================
-- ENHANCED TABLE - Comprehensive encounter-diagnosis relationship
-- FIELDS: Diagnosis code (ICD-10), status (confirmed/suspected/ruled out)
-- FIELDS: Primary vs secondary diagnosis tracking
-- FIELDS: Onset and resolution dates for chronic conditions
-- FIELDS: Clinical presentation and findings
-- FIELDS: Investigation and confirmation methods
-- FIELDS: Treatment plan and outcome tracking
-- FIELDS: Referral to specialist tracking
-- FIELDS: Follow-up scheduling and management
-- FIELDS: Comorbidity and drug contraindication tracking
-- FIELDS: Clinical validation workflow
-- INDEXES: Encounter, Patient, DiagnosisCode lookups
-- INDEXES: Primary diagnosis queries, follow-up pending
-- ============================================================================
