-- ============================================================================
-- HIMS Bill Table - REFACTORED FOR ENTERPRISE READINESS
-- ============================================================================
-- Changes from original:
-- 1. Changed BillId from BIGINT (good), but added IDENTITY if missing
-- 2. Changed PatientId to BIGINT, NOT NULL
-- 3. Changed BillDate from DATETIME to DATETIME2(7)
-- 4. Added comprehensive billing fields
-- 5. Added ALL missing foreign key constraints
-- 6. Added audit columns for complete tracking
-- 7. Added IsDeleted for soft delete pattern
-- 8. Standardized all monetary amounts to DECIMAL(18,2)
-- 9. Added invoice status tracking
-- ============================================================================

CREATE TABLE [dbo].[Bill] (
    -- PRIMARY KEY
    [BillId]                    BIGINT          IDENTITY (1, 1) NOT NULL,  -- Should be auto-generated
    
    -- FOREIGN KEYS
    [PatientId]                 BIGINT          NOT NULL,                   -- Changed to NOT NULL
    [AdmissionId]               BIGINT          NULL,                       -- NEW - Link to admission
    [EncounterId]               BIGINT          NULL,                       -- NEW - Link to encounter
    [VisitId]                   BIGINT          NULL,                       -- NEW - Link to visit
    [InsuranceClaimId]          BIGINT          NULL,                       -- NEW - Insurance tracking
    [BillStatusId]              INT             NOT NULL DEFAULT 1,         -- NEW - Bill status tracking
    
    -- BILL INFORMATION
    [BillNumber]                VARCHAR (50)    NOT NULL UNIQUE,            -- NEW - Unique bill reference
    [BillDate]                  DATETIME2(7)    NOT NULL,                   -- Changed from DATETIME
    [DueDate]                   DATETIME2(7)    NULL,                       -- NEW - Payment due date
    [BillFromDate]              DATE            NULL,                       -- NEW - Service period from
    [BillToDate]                DATE            NULL,                       -- NEW - Service period to
    
    -- AMOUNT BREAKDOWN
    [SubTotal]                  DECIMAL(18, 2)  NOT NULL,                   -- NEW - Before tax/discount
    [TaxAmount]                 DECIMAL(18, 2)  NOT NULL DEFAULT 0,        -- Tax/GST
    [DiscountAmount]            DECIMAL(18, 2)  NOT NULL DEFAULT 0,        -- Discount amount
    [DiscountPercentage]        DECIMAL(5, 2)   NOT NULL DEFAULT 0,        -- Discount %
    [TotalAmount]               DECIMAL(18, 2)  NOT NULL,                   -- Grand total
    [InsuranceAmount]           DECIMAL(18, 2)  NOT NULL DEFAULT 0,        -- Insurance coverage
    [PatientResponsibility]     DECIMAL(18, 2)  NOT NULL,                   -- Amount patient owes
    
    -- PAYMENT INFORMATION
    [PaidAmount]                DECIMAL(18, 2)  NOT NULL DEFAULT 0,        -- Amount paid
    [BalanceAmount]             DECIMAL(18, 2)  NOT NULL,                   -- Remaining amount
    [PaymentDueDate]            DATETIME2(7)    NULL,                       -- NEW - Final payment due
    [LastPaymentDate]           DATETIME2(7)    NULL,                       -- NEW - Last payment received
    
    -- NOTES & REFERENCES
    [BillNotes]                 NVARCHAR (MAX)  NULL,                       -- NEW - Internal notes
    [ReferenceNumber]           VARCHAR (100)   NULL,                       -- NEW - Insurance reference
    [ReverseChargeApplicable]   BIT             NOT NULL DEFAULT 0,        -- NEW - Tax regulation
    
    -- STATUS
    [IsActive]                  BIT             NOT NULL DEFAULT 1,
    [IsDeleted]                 BIT             NOT NULL DEFAULT 0,         -- NEW - Soft delete
    [IsFinal]                   BIT             NOT NULL DEFAULT 0,         -- NEW - Locked/finalized
    
    -- AUDIT
    [CreatedBy]                 BIGINT          NOT NULL,                   -- NEW - Audit
    [CreatedOn]                 DATETIME2(7)    NOT NULL DEFAULT GETDATE(), -- NEW - Audit
    [ModifiedBy]                BIGINT          NULL,                       -- NEW - Audit
    [ModifiedOn]                DATETIME2(7)    NULL,                       -- NEW - Audit
    [RowVersion]                ROWVERSION      NOT NULL,                   -- NEW - Optimistic locking
    
    -- CONSTRAINTS
    PRIMARY KEY CLUSTERED ([BillId] ASC),
    
    -- FOREIGN KEY CONSTRAINTS
    CONSTRAINT [FK_Bill_Patient]
        FOREIGN KEY ([PatientId]) REFERENCES [dbo].[Patient] ([PatientId]),
    CONSTRAINT [FK_Bill_Admission]
        FOREIGN KEY ([AdmissionId]) REFERENCES [dbo].[Admission] ([AdmissionId]),
    CONSTRAINT [FK_Bill_Encounter]
        FOREIGN KEY ([EncounterId]) REFERENCES [dbo].[Encounter] ([EncounterId]),
    CONSTRAINT [FK_Bill_Visit]
        FOREIGN KEY ([VisitId]) REFERENCES [dbo].[Visit] ([VisitId]),
    CONSTRAINT [FK_Bill_InsuranceClaim]
        FOREIGN KEY ([InsuranceClaimId]) REFERENCES [dbo].[InsuranceClaim] ([InsuranceClaimId]),
    CONSTRAINT [FK_Bill_BillStatus]
        FOREIGN KEY ([BillStatusId]) REFERENCES [dbo].[BillStatus] ([BillStatusId]),
    CONSTRAINT [FK_Bill_CreatedBy]
        FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[ApplicationUser] ([UserId]),
    CONSTRAINT [FK_Bill_ModifiedBy]
        FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[ApplicationUser] ([UserId]),
    
    -- CHECK CONSTRAINTS
    CONSTRAINT [CK_Bill_BillNumber]
        CHECK ([BillNumber] IS NOT NULL AND LEN([BillNumber]) > 0),
    CONSTRAINT [CK_Bill_BillDate]
        CHECK ([BillDate] <= GETDATE()),                                   -- Bill date in past or today
    CONSTRAINT [CK_Bill_DateRange]
        CHECK ([BillFromDate] IS NULL OR [BillToDate] IS NULL OR [BillFromDate] <= [BillToDate]),
    CONSTRAINT [CK_Bill_Amounts]
        CHECK ([SubTotal] >= 0 AND [TaxAmount] >= 0 AND [DiscountAmount] >= 0 AND [TotalAmount] >= 0),
    CONSTRAINT [CK_Bill_TotalCalculation]
        CHECK ([TotalAmount] = [SubTotal] + [TaxAmount] - [DiscountAmount]),
    CONSTRAINT [CK_Bill_PaidAmount]
        CHECK ([PaidAmount] >= 0 AND [PaidAmount] <= [TotalAmount]),
    CONSTRAINT [CK_Bill_BalanceAmount]
        CHECK ([BalanceAmount] = [TotalAmount] - [PaidAmount]),
    CONSTRAINT [CK_Bill_DiscountPercentage]
        CHECK ([DiscountPercentage] >= 0 AND [DiscountPercentage] <= 100),
    CONSTRAINT [CK_Bill_InsuranceAmount]
        CHECK ([InsuranceAmount] >= 0 AND [InsuranceAmount] <= [TotalAmount]),
    CONSTRAINT [CK_Bill_PatientResponsibility]
        CHECK ([PatientResponsibility] >= 0 AND [PatientResponsibility] <= [TotalAmount])
);

-- CREATE INDEXES
CREATE NONCLUSTERED INDEX [IX_Bill_PatientId] ON [dbo].[Bill]([PatientId]);
CREATE NONCLUSTERED INDEX [IX_Bill_BillNumber] ON [dbo].[Bill]([BillNumber]);
CREATE NONCLUSTERED INDEX [IX_Bill_BillDate] ON [dbo].[Bill]([BillDate]);
CREATE NONCLUSTERED INDEX [IX_Bill_BillStatusId] ON [dbo].[Bill]([BillStatusId]);
CREATE NONCLUSTERED INDEX [IX_Bill_AdmissionId] ON [dbo].[Bill]([AdmissionId]);
CREATE NONCLUSTERED INDEX [IX_Bill_EncounterId] ON [dbo].[Bill]([EncounterId]);
CREATE NONCLUSTERED INDEX [IX_Bill_VisitId] ON [dbo].[Bill]([VisitId]);
CREATE NONCLUSTERED INDEX [IX_Bill_DueDate] ON [dbo].[Bill]([DueDate]);

-- Filtered index for pending bills
CREATE NONCLUSTERED INDEX [IX_Bill_PendingPayment]
    ON [dbo].[Bill]([PatientId], [DueDate])
    WHERE [IsDeleted] = 0 AND [IsFinal] = 1 AND [BalanceAmount] > 0;

CREATE NONCLUSTERED INDEX [IX_Bill_Search]
    ON [dbo].[Bill]([BillDate], [BillStatusId])
    INCLUDE ([PatientId], [TotalAmount], [BalanceAmount]);

-- ============================================================================
-- CHANGE SUMMARY
-- ============================================================================
-- ADDED: BillNumber, AdmissionId, EncounterId, VisitId, InsuranceClaimId, BillStatusId
-- CHANGED: PatientId to NOT NULL
-- ADDED: BillFromDate, BillToDate (service period tracking)
-- ADDED: SubTotal, TaxAmount, DiscountPercentage, DiscountAmount, PatientResponsibility
-- ADDED: InsuranceAmount, PaymentDueDate, LastPaymentDate, BalanceAmount (corrected)
-- ADDED: BillNotes, ReferenceNumber, ReverseChargeApplicable
-- ADDED: IsFinal, IsDeleted
-- ADDED: CreatedBy, CreatedOn, ModifiedBy, ModifiedOn, RowVersion (audit & locking)
-- ADDED: ALL missing FK constraints (Patient, Admission, Encounter, Visit, etc.)
-- CHANGED: BillDate from DATETIME to DATETIME2(7)
-- ADDED: Comprehensive CHECK constraints for amount validation and logical consistency
-- ADDED: Multiple indexes for billing queries and reporting
-- ============================================================================
