-- ============================================================================
-- HIMS Payment Table - REFACTORED FOR ENTERPRISE READINESS
-- ============================================================================
-- Changes from original:
-- 1. Changed PaymentId, BillId, CurrencyId to BIGINT
-- 2. Changed ReceivedBy from INT to BIGINT
-- 3. Added NOT NULL constraints to required fields
-- 4. Changed DATETIME to DATETIME2(7)
-- 5. Added ALL missing foreign key constraints
-- 6. Added comprehensive audit columns
-- 7. Standardized DECIMAL to (18,2)
-- ============================================================================

CREATE TABLE [dbo].[Payment] (
    -- PRIMARY KEY
    [PaymentId]                 BIGINT          IDENTITY (1, 1) NOT NULL,
    
    -- FOREIGN KEYS
    [BillId]                    BIGINT          NOT NULL,                   -- Changed to NOT NULL
    [PaymentModeId]             INT             NOT NULL,                   -- Changed to NOT NULL
    [PaymentStatusId]           INT             NOT NULL DEFAULT 1,         -- NEW - Payment status
    [CurrencyId]                BIGINT          NULL,
    [ReceivedBy]                BIGINT          NOT NULL,                   -- Changed from INT to BIGINT
    
    -- PAYMENT DETAILS
    [PaymentDate]               DATETIME2(7)    NOT NULL,                   -- Changed from DATETIME
    [Amount]                    DECIMAL(18, 2)  NOT NULL,                   -- Changed to NOT NULL
    [ExchangeRate]              DECIMAL(10, 4)  NOT NULL DEFAULT 1,        -- For multi-currency
    [AmountInBaseCurrency]      DECIMAL(18, 2)  NOT NULL,                   -- NEW - Amount in base currency
    [SurchargeAmount]           DECIMAL(18, 2)  NOT NULL DEFAULT 0,        -- NEW - Any surcharge
    [NetAmount]                 DECIMAL(18, 2)  NOT NULL,                   -- NEW - Final amount
    
    -- TRANSACTION TRACKING
    [TransactionReference]      NVARCHAR (100)  NOT NULL,                   -- Changed to NOT NULL
    [PaymentGateway]            VARCHAR (50)    NULL,                       -- Online payment gateway
    [PaymentGatewayRefId]       VARCHAR (100)   NULL,                       -- NEW - Gateway transaction ID
    [TransactionId]             VARCHAR (100)   NULL,                       -- NEW - Internal transaction ID
    [ReceiptNumber]             VARCHAR (50)    NULL,                       -- NEW - Receipt reference
    
    -- PAYMENT METHOD DETAILS
    [ChequeNumber]              VARCHAR (50)    NULL,                       -- NEW - If payment by cheque
    [ChequeDate]                DATE            NULL,                       -- NEW - Cheque date
    [BankName]                  VARCHAR (100)   NULL,                       -- NEW - Bank name
    [CardLastFourDigits]        VARCHAR (10)    NULL,                       -- NEW - If card payment
    [CardHolderName]            VARCHAR (100)   NULL,                       -- NEW - Card holder
    [UPIId]                     VARCHAR (100)   NULL,                       -- NEW - If UPI payment
    
    -- NOTES
    [PaymentNotes]              NVARCHAR (MAX)  NULL,                       -- NEW - Payment remarks
    [ClearedBy]                 BIGINT          NULL,                       -- NEW - Who cleared payment
    [ClearedOn]                 DATETIME2(7)    NULL,                       -- NEW - When cleared
    [ClearanceRemarks]          NVARCHAR (500)  NULL,                       -- NEW - Clearance notes
    
    -- STATUS
    [IsActive]                  BIT             NOT NULL DEFAULT 1,
    [IsDeleted]                 BIT             NOT NULL DEFAULT 0,         -- NEW - Soft delete
    [IsReconciled]              BIT             NOT NULL DEFAULT 0,         -- NEW - Accounting reconciled
    
    -- AUDIT
    [CreatedBy]                 BIGINT          NOT NULL,                   -- NEW - Audit
    [CreatedOn]                 DATETIME2(7)    NOT NULL DEFAULT GETDATE(), -- NEW - Audit
    [ModifiedBy]                BIGINT          NULL,                       -- NEW - Audit
    [ModifiedOn]                DATETIME2(7)    NULL,                       -- NEW - Audit
    [RowVersion]                ROWVERSION      NOT NULL,                   -- NEW - Optimistic locking
    
    -- CONSTRAINTS
    PRIMARY KEY CLUSTERED ([PaymentId] ASC),
    
    CONSTRAINT [FK_Payment_Bill]
        FOREIGN KEY ([BillId]) REFERENCES [dbo].[Bill] ([BillId]),
    CONSTRAINT [FK_Payment_PaymentMode]
        FOREIGN KEY ([PaymentModeId]) REFERENCES [dbo].[PaymentMode] ([PaymentModeId]),
    CONSTRAINT [FK_Payment_PaymentStatus]
        FOREIGN KEY ([PaymentStatusId]) REFERENCES [dbo].[PaymentStatus] ([PaymentStatusId]),
    CONSTRAINT [FK_Payment_Currency]
        FOREIGN KEY ([CurrencyId]) REFERENCES [dbo].[Currency] ([CurrencyId]),
    CONSTRAINT [FK_Payment_ReceivedBy]
        FOREIGN KEY ([ReceivedBy]) REFERENCES [dbo].[ApplicationUser] ([UserId]),
    CONSTRAINT [FK_Payment_ClearedBy]
        FOREIGN KEY ([ClearedBy]) REFERENCES [dbo].[ApplicationUser] ([UserId]),
    CONSTRAINT [FK_Payment_CreatedBy]
        FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[ApplicationUser] ([UserId]),
    CONSTRAINT [FK_Payment_ModifiedBy]
        FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[ApplicationUser] ([UserId]),
    
    -- CHECK CONSTRAINTS
    CONSTRAINT [CK_Payment_Amount]
        CHECK ([Amount] > 0),
    CONSTRAINT [CK_Payment_ExchangeRate]
        CHECK ([ExchangeRate] > 0),
    CONSTRAINT [CK_Payment_AmountInBaseCurrency]
        CHECK ([AmountInBaseCurrency] > 0),
    CONSTRAINT [CK_Payment_SurchargeAmount]
        CHECK ([SurchargeAmount] >= 0),
    CONSTRAINT [CK_Payment_NetAmount]
        CHECK ([NetAmount] > 0),
    CONSTRAINT [CK_Payment_NetAmountCalculation]
        CHECK ([NetAmount] = ([Amount] * [ExchangeRate]) + [SurchargeAmount]),
    CONSTRAINT [CK_Payment_ChequeLogic]
        CHECK ([ChequeNumber] IS NULL OR [ChequeDate] IS NOT NULL),
    CONSTRAINT [CK_Payment_ClearedLogic]
        CHECK ([ClearedBy] IS NULL OR [ClearedOn] IS NOT NULL)
);

-- CREATE INDEXES
CREATE NONCLUSTERED INDEX [IX_Payment_BillId] ON [dbo].[Payment]([BillId]);
CREATE NONCLUSTERED INDEX [IX_Payment_PaymentDate] ON [dbo].[Payment]([PaymentDate]);
CREATE NONCLUSTERED INDEX [IX_Payment_TransactionReference] ON [dbo].[Payment]([TransactionReference]);
CREATE NONCLUSTERED INDEX [IX_Payment_ReceivedBy] ON [dbo].[Payment]([ReceivedBy]);
CREATE NONCLUSTERED INDEX [IX_Payment_PaymentStatusId] ON [dbo].[Payment]([PaymentStatusId]);
CREATE NONCLUSTERED INDEX [IX_Payment_PaymentModeId] ON [dbo].[Payment]([PaymentModeId]);

-- Filtered indexes
CREATE NONCLUSTERED INDEX [IX_Payment_Unreconciled]
    ON [dbo].[Payment]([PaymentDate])
    WHERE [IsDeleted] = 0 AND [IsReconciled] = 0;

CREATE NONCLUSTERED INDEX [IX_Payment_Search]
    ON [dbo].[Payment]([PaymentDate], [PaymentStatusId])
    INCLUDE ([BillId], [Amount], [TransactionReference]);

-- ============================================================================
-- CHANGE SUMMARY
-- ============================================================================
-- CHANGED: PaymentId, BillId, CurrencyId to BIGINT
-- CHANGED: ReceivedBy from INT to BIGINT
-- ADDED: NOT NULL to BillId, PaymentModeId, PaymentStatusId, Amount, TransactionReference, ReceivedBy, PaymentDate
-- ADDED: PaymentStatusId (status tracking)
-- ADDED: AmountInBaseCurrency, SurchargeAmount, NetAmount
-- ADDED: PaymentGatewayRefId, TransactionId, ReceiptNumber
-- ADDED: ChequeNumber, ChequeDate, BankName, CardLastFourDigits, CardHolderName, UPIId
-- ADDED: PaymentNotes, ClearedBy, ClearedOn, ClearanceRemarks
-- ADDED: IsDeleted, IsReconciled
-- ADDED: CreatedBy, CreatedOn, ModifiedBy, ModifiedOn, RowVersion (audit & locking)
-- ADDED: ALL missing FK constraints
-- CHANGED: PaymentDate from DATETIME to DATETIME2(7)
-- ADDED: Comprehensive CHECK constraints for amount validation
-- ADDED: Multiple indexes for payment queries and reconciliation
-- ============================================================================
