-- ============================================================================
-- HIMS Drug Table - REFACTORED FOR ENTERPRISE READINESS
-- ============================================================================
-- Changes from original:
-- 1. Changed DrugId to BIGINT IDENTITY
-- 2. Added NOT NULL constraints
-- 3. Added comprehensive drug information
-- 4. Added FK constraints
-- 5. Added audit columns
-- 6. Added drug safety information
-- ============================================================================

CREATE TABLE [dbo].[Drug] (
    -- PRIMARY KEY
    [DrugId]                    BIGINT          IDENTITY (1, 1) NOT NULL,
    
    -- DRUG BASIC INFORMATION
    [DrugCode]                  VARCHAR (50)    NOT NULL UNIQUE,            -- NEW - Unique drug code
    [DrugName]                  NVARCHAR (200)  NOT NULL,                   -- Changed to NOT NULL
    [GenericName]               NVARCHAR (200)  NOT NULL,                   -- NEW - Generic drug name
    [BrandName]                 NVARCHAR (200)  NULL,                       -- NEW - Brand name
    [Manufacturer]              NVARCHAR (200)  NULL,                       -- NEW - Drug manufacturer
    
    -- DRUG CLASSIFICATION
    [DrugCategoryId]            INT             NOT NULL,                   -- Changed to NOT NULL
    [DosageFormId]              INT             NULL,                       -- NEW - Tablet, injection, etc.
    [StrengthValue]             DECIMAL(10, 4)  NULL,                       -- NEW - Strength (e.g., 500)
    [StrengthUnit]              VARCHAR (50)    NULL,                       -- NEW - Unit (mg, ml, etc.)
    [TherapeuticClassId]        INT             NULL,                       -- NEW - Therapeutic classification
    
    -- DRUG DETAILS
    [HSNCode]                   VARCHAR (50)    NULL,                       -- NEW - HSN code for GST
    [SACSCode]                  VARCHAR (50)    NULL,                       -- NEW - SAC code
    [MedicineType]              VARCHAR (50)    NULL,                       -- NEW - Allopathy, Ayurveda, etc.
    [StorageTemperature]        VARCHAR (50)    NULL,                       -- NEW - Storage condition
    [StorageLocation]           VARCHAR (100)   NULL,                       -- NEW - Warehouse location
    
    -- REGULATORY & SAFETY
    [IsScheduledDrug]           BIT             NOT NULL DEFAULT 0,         -- NEW - Controlled substance
    [ScheduleType]              VARCHAR (50)    NULL,                       -- NEW - Schedule H, X, etc.
    [RequiresPrescription]      BIT             NOT NULL DEFAULT 0,         -- NEW - Needs Rx
    [Contraindications]         NVARCHAR (MAX)  NULL,                       -- NEW - When not to use
    [SideEffects]               NVARCHAR (MAX)  NULL,                       -- NEW - Common side effects
    [Interactions]              NVARCHAR (MAX)  NULL,                       -- NEW - Drug interactions
    [Warnings]                  NVARCHAR (MAX)  NULL,                       -- NEW - Special warnings
    [PregnancyCategory]         VARCHAR (50)    NULL,                       -- NEW - FDA pregnancy category
    
    -- DOSAGE & ADMINISTRATION
    [RecommendedDosage]         NVARCHAR (500)  NULL,                       -- NEW - Standard dosage
    [MaximumDailyDose]          DECIMAL(10, 4)  NULL,                       -- NEW - Max daily dose
    [RouteOfAdministration]     VARCHAR (100)   NULL,                       -- NEW - Oral, IV, IM, etc.
    [AdministrationNotes]       NVARCHAR (MAX)  NULL,                       -- NEW - How to give
    
    -- PRICING
    [MRPPrice]                  DECIMAL(18, 2)  NULL,                       -- NEW - Max Retail Price
    [HospitalCost]              DECIMAL(18, 2)  NULL,                       -- NEW - Hospital cost
    [SalePrice]                 DECIMAL(18, 2)  NULL,                       -- NEW - Sale price
    [GSTPct]                    DECIMAL(5, 2)   NULL,                       -- NEW - GST %
    [LastPriceUpdate]           DATETIME2(7)    NULL,                       -- NEW - When price updated
    
    -- INVENTORY
    [MinimumStockLevel]         INT             NULL,                       -- NEW - Min stock alert
    [ReorderQuantity]           INT             NULL,                       -- NEW - Reorder quantity
    [ExpiryDateTracking]        BIT             NOT NULL DEFAULT 1,         -- NEW - Track expiry
    
    -- STATUS
    [IsActive]                  BIT             NOT NULL DEFAULT 1,
    [IsDeleted]                 BIT             NOT NULL DEFAULT 0,         -- NEW - Soft delete
    [IsDiscontinued]            BIT             NOT NULL DEFAULT 0,         -- NEW - Discontinued
    [DiscontinuedDate]          DATETIME2(7)    NULL,                       -- NEW - When discontinued
    
    -- AUDIT
    [CreatedBy]                 BIGINT          NOT NULL,                   -- NEW - Audit
    [CreatedOn]                 DATETIME2(7)    NOT NULL DEFAULT GETDATE(), -- NEW - Audit
    [ModifiedBy]                BIGINT          NULL,                       -- NEW - Audit
    [ModifiedOn]                DATETIME2(7)    NULL,                       -- NEW - Audit
    [RowVersion]                ROWVERSION      NOT NULL,                   -- NEW - Optimistic locking
    
    -- CONSTRAINTS
    PRIMARY KEY CLUSTERED ([DrugId] ASC),
    
    CONSTRAINT [FK_Drug_DrugCategory]
        FOREIGN KEY ([DrugCategoryId]) REFERENCES [dbo].[DrugCategory] ([DrugCategoryId]),
    CONSTRAINT [FK_Drug_DosageForm]
        FOREIGN KEY ([DosageFormId]) REFERENCES [dbo].[DosageForm] ([DosageFormId]),
    CONSTRAINT [FK_Drug_TherapeuticClass]
        FOREIGN KEY ([TherapeuticClassId]) REFERENCES [dbo].[TherapeuticClass] ([TherapeuticClassId]),
    CONSTRAINT [FK_Drug_CreatedBy]
        FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[ApplicationUser] ([UserId]),
    CONSTRAINT [FK_Drug_ModifiedBy]
        FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[ApplicationUser] ([UserId]),
    
    -- CHECK CONSTRAINTS
    CONSTRAINT [CK_Drug_StrengthValue]
        CHECK ([StrengthValue] IS NULL OR [StrengthValue] > 0),
    CONSTRAINT [CK_Drug_MaximumDailyDose]
        CHECK ([MaximumDailyDose] IS NULL OR [MaximumDailyDose] > 0),
    CONSTRAINT [CK_Drug_Pricing]
        CHECK ([MRPPrice] IS NULL OR [MRPPrice] > 0),
    CONSTRAINT [CK_Drug_GST]
        CHECK ([GSTPct] IS NULL OR ([GSTPct] >= 0 AND [GSTPct] <= 100)),
    CONSTRAINT [CK_Drug_StockLevels]
        CHECK ([MinimumStockLevel] IS NULL OR [MinimumStockLevel] >= 0),
    CONSTRAINT [CK_Drug_DiscontinuedLogic]
        CHECK ([IsDiscontinued] = 0 OR [DiscontinuedDate] IS NOT NULL),
    CONSTRAINT [CK_Drug_ScheduleLogic]
        CHECK ([IsScheduledDrug] = 0 OR [ScheduleType] IS NOT NULL),
    
    UNIQUE NONCLUSTERED ([DrugCode] ASC)
);

-- CREATE INDEXES
CREATE NONCLUSTERED INDEX [IX_Drug_DrugCode] ON [dbo].[Drug]([DrugCode]);
CREATE NONCLUSTERED INDEX [IX_Drug_DrugName] ON [dbo].[Drug]([DrugName]);
CREATE NONCLUSTERED INDEX [IX_Drug_GenericName] ON [dbo].[Drug]([GenericName]);
CREATE NONCLUSTERED INDEX [IX_Drug_DrugCategoryId] ON [dbo].[Drug]([DrugCategoryId]);
CREATE NONCLUSTERED INDEX [IX_Drug_DosageFormId] ON [dbo].[Drug]([DosageFormId]);
CREATE NONCLUSTERED INDEX [IX_Drug_TherapeuticClassId] ON [dbo].[Drug]([TherapeuticClassId]);

-- Filtered indexes
CREATE NONCLUSTERED INDEX [IX_Drug_Active]
    ON [dbo].[Drug]([DrugName], [IsScheduledDrug])
    WHERE [IsDeleted] = 0 AND [IsActive] = 1 AND [IsDiscontinued] = 0;

CREATE NONCLUSTERED INDEX [IX_Drug_Scheduled]
    ON [dbo].[Drug]([DrugName])
    WHERE [IsDeleted] = 0 AND [IsScheduledDrug] = 1;

CREATE NONCLUSTERED INDEX [IX_Drug_Search]
    ON [dbo].[Drug]([DrugCode], [DrugName], [GenericName])
    INCLUDE ([DosageFormId], [StrengthValue], [StrengthUnit]);

-- ============================================================================
-- CHANGE SUMMARY
-- ============================================================================
-- CHANGED: DrugId to BIGINT IDENTITY
-- ADDED: DrugCode, GenericName, BrandName, Manufacturer
-- ADDED: NOT NULL to DrugCategoryId, DrugName
-- ADDED: DosageFormId, TherapeuticClassId, StrengthValue, StrengthUnit
-- ADDED: Regulatory fields (HSNCode, SACSCode, MedicineType, ScheduleType, etc.)
-- ADDED: Safety information (Contraindications, SideEffects, Interactions, Warnings, PregnancyCategory)
-- ADDED: Dosage fields (RecommendedDosage, MaximumDailyDose, RouteOfAdministration)
-- ADDED: Pricing fields (MRPPrice, HospitalCost, SalePrice, GSTPct, LastPriceUpdate)
-- ADDED: Inventory fields (MinimumStockLevel, ReorderQuantity, ExpiryDateTracking)
-- ADDED: IsDiscontinued, DiscontinuedDate (drug lifecycle tracking)
-- ADDED: CreatedBy, CreatedOn, ModifiedBy, ModifiedOn, IsDeleted, RowVersion (audit & locking)
-- ADDED: ALL FK constraints
-- ADDED: Comprehensive CHECK constraints for validation
-- ADDED: Multiple indexes for drug search and filtering
-- ============================================================================
