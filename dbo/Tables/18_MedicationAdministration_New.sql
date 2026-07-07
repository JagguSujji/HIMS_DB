-- ============================================================================
-- HIMS MedicationAdministration Table - NEW FOR CLINICAL WORKFLOW
-- ============================================================================
-- Purpose: Track when and how medications are actually given to patients
-- This is critical for clinical workflow and patient safety
-- ============================================================================

CREATE TABLE [dbo].[MedicationAdministration] (
    -- PRIMARY KEY
    [MedicationAdministrationId] BIGINT         IDENTITY (1, 1) NOT NULL,
    
    -- FOREIGN KEYS
    [PrescriptionId]            BIGINT         NOT NULL,                   -- Link to prescription
    [PrescriptionItemId]        BIGINT         NULL,                       -- Specific prescription item
    [PatientId]                 BIGINT         NOT NULL,                   -- Direct patient link
    [EncounterId]               BIGINT         NULL,                       -- Associated encounter
    [AdmissionId]               BIGINT         NULL,                       -- If inpatient
    [DrugId]                    BIGINT         NOT NULL,                   -- Which drug
    [AdministeredBy]            BIGINT         NOT NULL,                   -- Who gave it (nurse/doctor)
    [VerifiedBy]                BIGINT         NULL,                       -- Who verified it
    
    -- ADMINISTRATION DETAILS
    [AdministrationDateTime]    DATETIME2(7)   NOT NULL,
    [ScheduledDateTime]         DATETIME2(7)   NULL,                       -- When it was supposed to be given
    [DoseGiven]                 DECIMAL(10, 2) NOT NULL,
    [UnitOfMeasure]             VARCHAR (30)   NOT NULL,                   -- mg, ml, tablets, etc.
    [RouteOfAdministration]     VARCHAR (30)   NOT NULL,                   -- Oral, IV, IM, SC, etc.
    [SiteOfAdministration]      VARCHAR (100)  NULL,                       -- Specific site (arm, leg, etc.)
    [BatchNumber]               VARCHAR (50)   NULL,                       -- Drug batch/lot number
    [ExpiryDate]                DATE           NULL,                       -- Drug expiry date
    [SerialNumber]              VARCHAR (100)  NULL,                       -- Drug serial number
    
    -- STATUS & OUTCOME
    [AdministrationStatus]      VARCHAR (50)   NOT NULL DEFAULT 'GIVEN',   -- Given, Refused, Missed, Held, etc.
    [ReasonIfNotGiven]          VARCHAR (200)  NULL,                       -- Why not given
    [PatientResponse]           NVARCHAR (MAX) NULL,                       -- How patient responded
    [AdverseReactionObserved]   BIT            NOT NULL DEFAULT 0,         -- Any adverse reaction
    [ReactionDescription]       NVARCHAR (MAX) NULL,                       -- Describe reaction
    [ActionTakenForReaction]    NVARCHAR (MAX) NULL,                       -- What was done
    
    -- NOTES & DOCUMENTATION
    [AdministrationNotes]       NVARCHAR (MAX) NULL,                       -- Nursing notes
    [VerificationNotes]         NVARCHAR (MAX) NULL,                       -- Verification notes
    [PrescriptionNotes]         NVARCHAR (MAX) NULL,                       -- Original prescription notes
    
    -- TIMING
    [IsLateAdministration]      BIT            NOT NULL DEFAULT 0,         -- Given after scheduled time
    [MinutesLate]               INT            NULL,                       -- How many minutes late
    [DocumentedDateTime]        DATETIME2(7)   NOT NULL DEFAULT GETDATE(), -- When documented
    
    -- STATUS
    [IsActive]                  BIT            NOT NULL DEFAULT 1,
    [IsDeleted]                 BIT            NOT NULL DEFAULT 0,
    [IsModified]                BIT            NOT NULL DEFAULT 0,         -- Has been edited
    [ModifiedCount]             INT            NOT NULL DEFAULT 0,         -- Number of edits
    
    -- AUDIT
    [CreatedBy]                 BIGINT         NOT NULL,
    [CreatedOn]                 DATETIME2(7)   NOT NULL DEFAULT GETDATE(),
    [ModifiedBy]                BIGINT         NULL,
    [ModifiedOn]                DATETIME2(7)   NULL,
    [VerifiedOn]                DATETIME2(7)   NULL,                       -- When verified
    [RowVersion]                ROWVERSION     NOT NULL,
    
    -- CONSTRAINTS
    PRIMARY KEY CLUSTERED ([MedicationAdministrationId] ASC),
    
    CONSTRAINT [FK_MedicationAdministration_Prescription]
        FOREIGN KEY ([PrescriptionId]) REFERENCES [dbo].[Prescription] ([PrescriptionId]),
    CONSTRAINT [FK_MedicationAdministration_Patient]
        FOREIGN KEY ([PatientId]) REFERENCES [dbo].[Patient] ([PatientId]),
    CONSTRAINT [FK_MedicationAdministration_Drug]
        FOREIGN KEY ([DrugId]) REFERENCES [dbo].[Drug] ([DrugId]),
    CONSTRAINT [FK_MedicationAdministration_AdministeredBy]
        FOREIGN KEY ([AdministeredBy]) REFERENCES [dbo].[Employee] ([EmployeeId]),
    CONSTRAINT [FK_MedicationAdministration_VerifiedBy]
        FOREIGN KEY ([VerifiedBy]) REFERENCES [dbo].[Employee] ([EmployeeId]),
    CONSTRAINT [FK_MedicationAdministration_Encounter]
        FOREIGN KEY ([EncounterId]) REFERENCES [dbo].[Encounter] ([EncounterId]),
    CONSTRAINT [FK_MedicationAdministration_Admission]
        FOREIGN KEY ([AdmissionId]) REFERENCES [dbo].[Admission] ([AdmissionId]),
    CONSTRAINT [FK_MedicationAdministration_CreatedBy]
        FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[ApplicationUser] ([UserId]),
    CONSTRAINT [FK_MedicationAdministration_ModifiedBy]
        FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[ApplicationUser] ([UserId]),
    
    -- CHECK CONSTRAINTS
    CONSTRAINT [CK_MedicationAdministration_DoseGiven]
        CHECK ([DoseGiven] > 0),
    CONSTRAINT [CK_MedicationAdministration_DateTime]
        CHECK ([AdministrationDateTime] <= GETDATE()),
    CONSTRAINT [CK_MedicationAdministration_ReasonIfNotGiven]
        CHECK ([AdministrationStatus] = 'GIVEN' OR [ReasonIfNotGiven] IS NOT NULL),
    CONSTRAINT [CK_MedicationAdministration_VerificationLogic]
        CHECK ([VerifiedBy] IS NULL OR [VerifiedOn] IS NOT NULL),
    CONSTRAINT [CK_MedicationAdministration_MinutesLate]
        CHECK ([IsLateAdministration] = 0 OR [MinutesLate] IS NOT NULL)
);

-- CREATE INDEXES
CREATE NONCLUSTERED INDEX [IX_MedicationAdministration_PatientId]
    ON [dbo].[MedicationAdministration]([PatientId])
    WHERE [IsDeleted] = 0;

CREATE NONCLUSTERED INDEX [IX_MedicationAdministration_PrescriptionId]
    ON [dbo].[MedicationAdministration]([PrescriptionId])
    WHERE [IsDeleted] = 0;

CREATE NONCLUSTERED INDEX [IX_MedicationAdministration_AdministrationDateTime]
    ON [dbo].[MedicationAdministration]([AdministrationDateTime] DESC)
    WHERE [IsDeleted] = 0;

CREATE NONCLUSTERED INDEX [IX_MedicationAdministration_AdministeredBy]
    ON [dbo].[MedicationAdministration]([AdministeredBy])
    WHERE [IsDeleted] = 0;

CREATE NONCLUSTERED INDEX [IX_MedicationAdministration_EncounterId]
    ON [dbo].[MedicationAdministration]([EncounterId])
    WHERE [IsDeleted] = 0;

CREATE NONCLUSTERED INDEX [IX_MedicationAdministration_AdmissionId]
    ON [dbo].[MedicationAdministration]([AdmissionId])
    WHERE [IsDeleted] = 0;

-- Filtered index for adverse reactions
CREATE NONCLUSTERED INDEX [IX_MedicationAdministration_AdverseReactions]
    ON [dbo].[MedicationAdministration]([PatientId], [AdministrationDateTime])
    WHERE [IsDeleted] = 0 AND [AdverseReactionObserved] = 1;

-- Filtered index for late administrations
CREATE NONCLUSTERED INDEX [IX_MedicationAdministration_LateAdministrations]
    ON [dbo].[MedicationAdministration]([AdministrationDateTime])
    WHERE [IsDeleted] = 0 AND [IsLateAdministration] = 1;

-- ============================================================================
-- CHANGE SUMMARY
-- ============================================================================
-- NEW TABLE - Tracks medication administration in clinical workflow
-- FIELDS: Administration details (when, how, by whom)
-- FIELDS: Drug batch/lot tracking (for medication recalls)
-- FIELDS: Patient response and adverse reaction tracking
-- FIELDS: Status tracking (given, refused, missed, held)
-- FIELDS: Verification workflow (who verified administration)
-- FIELDS: Comprehensive audit trail
-- INDEXES: Patient, Prescription, Encounter, Admission lookups
-- INDEXES: Date range queries, adverse reactions, late administrations
-- ============================================================================
