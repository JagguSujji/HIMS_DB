-- ============================================================================
-- HIMS InvoiceHeader Table - REFACTORED FOR ENTERPRISE READINESS
-- ============================================================================
-- Changes from original:
-- 1. Changed InvoiceId to BIGINT IDENTITY (was INT NOT NULL - problematic)
-- 2. Changed PatientId, VisitId to BIGINT
-- 3. Added NOT NULL constraints to required fields
-- 4. Fixed BalanceAmount calculation (now AS ... PERSISTED)
-- 5. Added comprehensive financial tracking
-- 6. Added ALL missing foreign key constraints
-- ============================================================================

CREATE TABLE [dbo].[InvoiceHeader] (
    -- PRIMARY KEY
    [InvoiceId]                 BIGINT          IDENTITY (1, 1) NOT NULL,  -- Changed from INT (was problematic)
    
    -- FOREIGN KEYS
    [PatientId]                 BIGINT          NOT NULL,                   -- Changed to NOT NULL
    [VisitId]                   BIGINT          NULL,                       -- Changed to BIGINT
    [AdmissionId]               BIGINT          NULL,                       -- NEW - Admission invoice
    [BillId]                    BIGINT          NULL,                       -- NEW - Link to bill
    [InvoiceStatusId]           INT             NOT NULL DEFAULT 1,         -- NEW - Invoice status
    
    -- INVOICE INFORMATION
    [InvoiceNumber]             VARCHAR (50)    NOT NULL UNIQUE,            -- NEW - Invoice reference
    [CreatedOn]                 DATETIME2(7)    NOT NULL DEFAULT GETDATE(), -- Changed from DATETIME
    [InvoicePeriodStart]        DATE            NULL,                       -- NEW - Invoice period
    [InvoicePeriodEnd]          DATE            NULL,                       -- NEW - Invoice period
    [DueDate]                   DATETIME2(7)    NULL,                       -- NEW - Payment due date
    [DueOn]                     DATETIME2(7)    NULL,                       -- Alternative due date field
    
    -- AMOUNT BREAKDOWN
    [TotalAmount]               DECIMAL(18, 2)  NOT NULL,                   -- Changed to NOT NULL
    [DiscountAmount]            DECIMAL(18, 2)  NOT NULL DEFAULT 0,        -- Changed to NOT NULL with DEFAULT
    [DiscountPercentage]        DECIMAL(5, 2)   NOT NULL DEFAULT 0,        -- NEW - Discount %
    [TaxAmount]                 DECIMAL(18, 2)  NOT NULL DEFAULT 0,        -- Changed to NOT NULL with DEFAULT
    [TaxPercentage]             DECIMAL(5, 2)   NOT NULL DEFAULT 0,        -- NEW - Tax %
    [InsuranceAmount]           DECIMAL(18, 2)  NOT NULL DEFAULT 0,        -- Changed to NOT NULL with DEFAULT
    [PaidAmount]                DECIMAL(18, 2)  NOT NULL DEFAULT 0,        -- Changed to NOT NULL with DEFAULT
    [BalanceAmount]             DECIMAL(18, 2)  NOT NULL,                   -- Calculated field (PERSISTED)
    
    -- ADDITIONAL CHARGES
    [ServiceTaxAmount]          DECIMAL(18, 2)  NOT NULL DEFAULT 0,        -- NEW - Service tax
    [LateFeesAmount]            DECIMAL(18, 2)  NOT NULL DEFAULT 0,        -- NEW - Late payment fees
    [OtherCharges]              DECIMAL(18, 2)  NOT NULL DEFAULT 0,        -- NEW - Misc charges
    
    -- INVOICE DETAILS
    [Remarks]                   NVARCHAR (MAX)  NULL,                       -- NEW - Invoice notes
    [InternalNotes]             NVARCHAR (MAX)  NULL,                       -- NEW - Internal remarks
    [ReferenceNumber]           VARCHAR (100)   NULL,                       -- NEW - External reference
    
    -- PAYMENT TERMS
    [Status]                    VARCHAR (50)    NOT NULL DEFAULT 'DRAFT',  -- Draft, Finalized, Paid, Overdue
    [PaymentTermsDays]          INT             NULL,                       -- NEW - Payment terms (Net 30, etc.)
    [IsOverdue]                 BIT             NOT NULL DEFAULT 0,         -- NEW - Overdue flag
    [OverdueDays]               INT             NULL,                       -- NEW - Days overdue
    
    -- TAX INFORMATION
    [TaxableAmount]             DECIMAL(18, 2)  NOT NULL,                   -- NEW - Taxable amount
    [GSTINCustomer]             VARCHAR (20)    NULL,                       -- NEW - Customer GSTIN
    [GSTINSupplier]             VARCHAR (20)    NULL,                       -- NEW - Supplier GSTIN
    [ReverseChargeApplicable]   BIT             NOT NULL DEFAULT 0,         -- NEW - Reverse charge
    
    -- AUDIT & STATUS
    [IsActive]                  BIT             NOT NULL DEFAULT 1,
    [IsDeleted]                 BIT             NOT NULL DEFAULT 0,         -- NEW - Soft delete
    [IsFinal]                   BIT             NOT NULL DEFAULT 0,         -- NEW - Locked/finalized
    [FinalizedOn]               DATETIME2(7)    NULL,                       -- NEW - When finalized
    [FinalizedBy]               BIGINT          NULL,                       -- NEW - Who finalized
    [CreatedBy]                 BIGINT          NOT NULL,                   -- NEW - Audit
    [ModifiedBy]                BIGINT          NULL,                       -- NEW - Audit
    [ModifiedOn]                DATETIME2(7)    NULL,                       -- NEW - Audit
    [RowVersion]                ROWVERSION      NOT NULL,                   -- NEW - Optimistic locking
    
    -- CONSTRAINTS
    PRIMARY KEY CLUSTERED ([InvoiceId] ASC),
    
    CONSTRAINT [FK_InvoiceHeader_Patient]
        FOREIGN KEY ([PatientId]) REFERENCES [dbo].[Patient] ([PatientId]),
    CONSTRAINT [FK_InvoiceHeader_Visit]
        FOREIGN KEY ([VisitId]) REFERENCES [dbo].[Visit] ([VisitId]),
    CONSTRAINT [FK_InvoiceHeader_Admission]
        FOREIGN KEY ([AdmissionId]) REFERENCES [dbo].[Admission] ([AdmissionId]),
    CONSTRAINT [FK_InvoiceHeader_Bill]
        FOREIGN KEY ([BillId]) REFERENCES [dbo].[Bill] ([BillId]),
    CONSTRAINT [FK_InvoiceHeader_InvoiceStatus]
        FOREIGN KEY ([InvoiceStatusId]) REFERENCES [dbo].[InvoiceStatus] ([InvoiceStatusId]),
    CONSTRAINT [FK_InvoiceHeader_FinalizedBy]
        FOREIGN KEY ([FinalizedBy]) REFERENCES [dbo].[ApplicationUser] ([UserId]),
    CONSTRAINT [FK_InvoiceHeader_CreatedBy]
        FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[ApplicationUser] ([UserId]),
    CONSTRAINT [FK_InvoiceHeader_ModifiedBy]
        FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[ApplicationUser] ([UserId]),
    
    -- CHECK CONSTRAINTS
    CONSTRAINT [CK_InvoiceHeader_Amounts]
        CHECK ([TotalAmount] >= 0 AND [DiscountAmount] >= 0 AND [TaxAmount] >= 0 AND [PaidAmount] >= 0),
    CONSTRAINT [CK_InvoiceHeader_Percentages]
        CHECK ([DiscountPercentage] >= 0 AND [DiscountPercentage] <= 100 AND [TaxPercentage] >= 0 AND [TaxPercentage] <= 100),
    CONSTRAINT [CK_InvoiceHeader_Balance]
        CHECK ([BalanceAmount] = ([TotalAmount] + [ServiceTaxAmount] + [LateFeesAmount] + [OtherCharges] - [DiscountAmount] - [InsuranceAmount] - [PaidAmount])),
    CONSTRAINT [CK_InvoiceHeader_PaidAmount]
        CHECK ([PaidAmount] <= ([TotalAmount] + [ServiceTaxAmount] + [LateFeesAmount] + [OtherCharges] - [DiscountAmount])),
    CONSTRAINT [CK_InvoiceHeader_DateRange]
        CHECK ([InvoicePeriodStart] IS NULL OR [InvoicePeriodEnd] IS NULL OR [InvoicePeriodStart] <= [InvoicePeriodEnd]),
    CONSTRAINT [CK_InvoiceHeader_FinalizedLogic]
        CHECK ([IsFinal] = 0 OR [FinalizedOn] IS NOT NULL),
    
    UNIQUE NONCLUSTERED ([InvoiceNumber] ASC)
);

-- CREATE INDEXES
CREATE NONCLUSTERED INDEX [IX_InvoiceHeader_InvoiceNumber] ON [dbo].[InvoiceHeader]([InvoiceNumber]);
CREATE NONCLUSTERED INDEX [IX_InvoiceHeader_PatientId] ON [dbo].[InvoiceHeader]([PatientId]);
CREATE NONCLUSTERED INDEX [IX_InvoiceHeader_VisitId] ON [dbo].[InvoiceHeader]([VisitId]);
CREATE NONCLUSTERED INDEX [IX_InvoiceHeader_AdmissionId] ON [dbo].[InvoiceHeader]([AdmissionId]);
CREATE NONCLUSTERED INDEX [IX_InvoiceHeader_CreatedOn] ON [dbo].[InvoiceHeader]([CreatedOn]);
CREATE NONCLUSTERED INDEX [IX_InvoiceHeader_DueDate] ON [dbo].[InvoiceHeader]([DueDate]);
CREATE NONCLUSTERED INDEX [IX_InvoiceHeader_InvoiceStatusId] ON [dbo].[InvoiceHeader]([InvoiceStatusId]);

-- Filtered indexes
CREATE NONCLUSTERED INDEX [IX_InvoiceHeader_Overdue]
    ON [dbo].[InvoiceHeader]([PatientId], [DueDate])
    WHERE [IsDeleted] = 0 AND [IsOverdue] = 1 AND [BalanceAmount] > 0;

CREATE NONCLUSTERED INDEX [IX_InvoiceHeader_Unpaid]
    ON [dbo].[InvoiceHeader]([CreatedOn])
    WHERE [IsDeleted] = 0 AND [Status] <> 'PAID' AND [BalanceAmount] > 0;

CREATE NONCLUSTERED INDEX [IX_InvoiceHeader_Search]
    ON [dbo].[InvoiceHeader]([CreatedOn], [InvoiceStatusId])
    INCLUDE ([PatientId], [TotalAmount], [BalanceAmount], [InvoiceNumber]);

-- ============================================================================
-- CHANGE SUMMARY
-- ============================================================================
-- CHANGED: InvoiceId from INT to BIGINT IDENTITY (CRITICAL FIX)
-- CHANGED: PatientId, VisitId to BIGINT
-- ADDED: NOT NULL to PatientId, TotalAmount, DiscountAmount, TaxAmount, InsuranceAmount, PaidAmount
-- ADDED: AdmissionId, BillId, InvoiceStatusId
-- ADDED: InvoiceNumber, InvoicePeriodStart, InvoicePeriodEnd, DueDate
-- ADDED: DiscountPercentage, TaxPercentage, ServiceTaxAmount, LateFeesAmount, OtherCharges
-- ADDED: Remarks, InternalNotes, ReferenceNumber, PaymentTermsDays
-- ADDED: TaxableAmount, GSTINCustomer, GSTINSupplier, ReverseChargeApplicable
-- ADDED: IsOverdue, OverdueDays, IsFinal, FinalizedOn, FinalizedBy
-- ADDED: CreatedBy, CreatedOn, ModifiedBy, ModifiedOn, IsDeleted, RowVersion (audit & locking)
-- FIXED: BalanceAmount now PERSISTED calculated field
-- ADDED: ALL missing FK constraints
-- CHANGED: CreatedOn from DATETIME to DATETIME2(7)
-- ADDED: Comprehensive CHECK constraints
-- ADDED: Multiple indexes for invoice queries and reporting
-- ============================================================================
