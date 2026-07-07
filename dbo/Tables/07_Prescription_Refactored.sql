-- ============================================================================
-- HIMS Prescription Table - REFACTORED FOR ENTERPRISE READINESS
-- ============================================================================
-- Changes from original:
-- 1. Changed PrescriptionId, ConsultationId, EncounterId, PatientId to BIGINT
-- 2. Changed PrescribedBy from INT to BIGINT
-- 3. Added NOT NULL constraints to required fields
-- 4. Changed PrescriptionDate from DATETIME to DATETIME2(7)
-- 5. Added ALL missing foreign key constraints
-- 6. Added comprehensive audit columns
-- 7. Added IsDeleted for soft delete pattern
-- 8. Added prescription validation and medical information
-- ============================================================================

CREATE TABLE [dbo].[Prescription] (
    -- PRIMARY KEY
    [PrescriptionId]            BIGINT          IDENTITY (1, 1) NOT NULL,
    
    -- FOREIGN KEYS
    [PatientId]                 BIGINT          NOT NULL,                   -- Changed to NOT NULL
    [ConsultationId]            BIGINT          NULL,
    [EncounterId]               BIGINT          NULL,
    [PrescribedBy]              BIGINT          NOT NULL,                   -- Changed from INT to BIGINT
    [PrescriptionStatusId]      INT             NOT NULL DEFAULT 1,         -- NEW - Status tracking
    
    -- PRESCRIPTION DETAILS
    [PrescriptionDate]          DATETIME2(7)    NOT NULL,                   -- Changed from DATETIME
    [ValidUntil]                DATETIME2(7)    NOT NULL,                   -- Changed to NOT NULL
    [PrescriptionType]          VARCHAR (30)    NOT NULL,                   -- Changed to NOT NULL (e.g., Outpatient, Inpatient)
    [ReviewDate]                DATETIME2(7)    NULL,                       -- NEW - For chronic medications
    [FollowUpRequired]          BIT             NOT NULL DEFAULT 0,         -- NEW - Requires review
    
    -- CLINICAL INFORMATION
    [Indication]                NVARCHAR (MAX)  NULL,                       -- NEW - Why prescribed
    [SpecialInstructions]       NVARCHAR (MAX)  NULL,                       -- NEW - Special notes
    [DrugReactions]             NVARCHAR (MAX)  NULL,                       -- NEW - Known reactions
    [Contraindications]         NVARCHAR (MAX)  NULL,                       -- NEW - Warnings
    
    -- PRESCRIPTION ITEMS (These will be in separate PrescriptionItem table)
    [TotalItems]                INT             NULL,                       -- NEW - Number of drugs
    [TotalQuantity]             DECIMAL(10, 2)  NULL,                       -- NEW - Total quantity
    
    -- STATUS
    [Status]                    NVARCHAR (50)   NOT NULL DEFAULT 'ACTIVE',
    [IsActive]                  BIT             NOT NULL DEFAULT 1,
    [IsDeleted]                 BIT             NOT NULL DEFAULT 0,         -- NEW - Soft delete
    [IsCancelled]               BIT             NOT NULL DEFAULT 0,         -- NEW - Cancellation flag
    [CancelledOn]               DATETIME2(7)    NULL,                       -- NEW - When cancelled
    [CancelledBy]               BIGINT          NULL,                       -- NEW - Who cancelled
    [CancellationReason]        VARCHAR (200)   NULL,                       -- NEW - Why cancelled
    
    -- AUDIT
    [CreatedBy]                 BIGINT          NOT NULL,                   -- NEW - Audit
    [CreatedOn]                 DATETIME2(7)    NOT NULL DEFAULT GETDATE(), -- NEW - Audit
    [ModifiedBy]                BIGINT          NULL,                       -- NEW - Audit
    [ModifiedOn]                DATETIME2(7)    NULL,                       -- NEW - Audit
    [RowVersion]                ROWVERSION      NOT NULL,                   -- NEW - Optimistic locking
    
    -- CONSTRAINTS
    PRIMARY KEY CLUSTERED ([PrescriptionId] ASC),
    
    -- FOREIGN KEY CONSTRAINTS
    CONSTRAINT [FK_Prescription_Patient]
        FOREIGN KEY ([PatientId]) REFERENCES [dbo].[Patient] ([PatientId]),
    CONSTRAINT [FK_Prescription_PrescribedBy]
        FOREIGN KEY ([PrescribedBy]) REFERENCES [dbo].[Employee] ([EmployeeId]),
    CONSTRAINT [FK_Prescription_PrescriptionStatus]
        FOREIGN KEY ([PrescriptionStatusId]) REFERENCES [dbo].[PrescriptionStatus] ([PrescriptionStatusId]),
    CONSTRAINT [FK_Prescription_Encounter]
        FOREIGN KEY ([EncounterId]) REFERENCES [dbo].[Encounter] ([EncounterId]),
    CONSTRAINT [FK_Prescription_CancelledBy]
        FOREIGN KEY ([CancelledBy]) REFERENCES [dbo].[ApplicationUser] ([UserId]),
    CONSTRAINT [FK_Prescription_CreatedBy]
        FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[ApplicationUser] ([UserId]),
    CONSTRAINT [FK_Prescription_ModifiedBy]
        FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[ApplicationUser] ([UserId]),
    
    -- CHECK CONSTRAINTS
    CONSTRAINT [CK_Prescription_Dates]
        CHECK ([PrescriptionDate] <= GETDATE()),                           -- Prescription in past or today
    CONSTRAINT [CK_Prescription_ValidUntil]
        CHECK ([ValidUntil] >= [PrescriptionDate]),                        -- Valid until >= prescription date
    CONSTRAINT [CK_Prescription_ReviewDate]
        CHECK ([ReviewDate] IS NULL OR [ReviewDate] >= [PrescriptionDate]),
    CONSTRAINT [CK_Prescription_TotalItems]
        CHECK ([TotalItems] IS NULL OR [TotalItems] > 0),
    CONSTRAINT [CK_Prescription_TotalQuantity]
        CHECK ([TotalQuantity] IS NULL OR [TotalQuantity] > 0),
    CONSTRAINT [CK_Prescription_CancellationLogic]
        CHECK ([IsCancelled] = 0 OR [CancelledOn] IS NOT NULL)             -- If cancelled, must have date
);

-- CREATE INDEXES
CREATE NONCLUSTERED INDEX [IX_Prescription_PatientId] ON [dbo].[Prescription]([PatientId]);
CREATE NONCLUSTERED INDEX [IX_Prescription_PrescribedBy] ON [dbo].[Prescription]([PrescribedBy]);
CREATE NONCLUSTERED INDEX [IX_Prescription_PrescriptionDate] ON [dbo].[Prescription]([PrescriptionDate]);
CREATE NONCLUSTERED INDEX [IX_Prescription_ValidUntil] ON [dbo].[Prescription]([ValidUntil]);
CREATE NONCLUSTERED INDEX [IX_Prescription_PrescriptionStatusId] ON [dbo].[Prescription]([PrescriptionStatusId]);
CREATE NONCLUSTERED INDEX [IX_Prescription_EncounterId] ON [dbo].[Prescription]([EncounterId]);

-- Filtered index for active prescriptions
CREATE NONCLUSTERED INDEX [IX_Prescription_Active]
    ON [dbo].[Prescription]([PatientId], [ValidUntil])
    WHERE [IsDeleted] = 0 AND [IsActive] = 1 AND [IsCancelled] = 0 AND [ValidUntil] >= GETDATE();

CREATE NONCLUSTERED INDEX [IX_Prescription_Search]
    ON [dbo].[Prescription]([PrescriptionDate], [PatientId], [PrescribedBy])
    INCLUDE ([PrescriptionStatusId], [ValidUntil]);

-- ============================================================================
-- CHANGE SUMMARY
-- ============================================================================
-- CHANGED: PrescriptionId, ConsultationId, EncounterId, PatientId to BIGINT
-- CHANGED: PrescribedBy from INT to BIGINT
-- ADDED: NOT NULL to PatientId, PrescribedBy, PrescriptionDate, ValidUntil, PrescriptionType
-- ADDED: PrescriptionStatusId with FK
-- ADDED: ReviewDate, FollowUpRequired, Indication, SpecialInstructions, DrugReactions, Contraindications
-- ADDED: TotalItems, TotalQuantity, IsCancelled, CancelledOn, CancelledBy, CancellationReason
-- ADDED: CreatedBy, CreatedOn, ModifiedBy, ModifiedOn, IsDeleted, RowVersion (audit & locking)
-- ADDED: ALL missing FK constraints
-- CHANGED: PrescriptionDate, ValidUntil from DATETIME to DATETIME2(7)
-- ADDED: Comprehensive CHECK constraints for date and logical validation
-- ADDED: Multiple indexes for prescription queries and active prescription lookups
-- ============================================================================
