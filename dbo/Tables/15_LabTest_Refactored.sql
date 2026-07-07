-- ============================================================================
-- HIMS LabTest Table - REFACTORED FOR ENTERPRISE READINESS
-- ============================================================================
-- Changes from original:
-- 1. Changed LabTestId to BIGINT (already good)
-- 2. Added NOT NULL constraints
-- 3. Added comprehensive lab test information
-- 4. Added ALL FK constraints
-- 5. Added audit columns
-- ============================================================================

CREATE TABLE [dbo].[LabTest] (
    -- PRIMARY KEY
    [LabTestId]                 BIGINT          IDENTITY (1, 1) NOT NULL,
    
    -- TEST IDENTIFICATION
    [TestCode]                  VARCHAR (30)    NOT NULL UNIQUE,            -- Changed to NOT NULL
    [TestName]                  NVARCHAR (200)  NOT NULL,                   -- Changed to NOT NULL
    [DisplayName]               NVARCHAR (200)  NULL,                       -- NEW - For UI display
    [Abbreviation]              VARCHAR (50)    NULL,                       -- NEW - Test abbreviation
    
    -- TEST CLASSIFICATION
    [TestCategoryId]            INT             NOT NULL,                   -- Changed to NOT NULL
    [LabSectionId]              INT             NOT NULL,                   -- Changed to NOT NULL
    [SampleTypeId]              INT             NOT NULL,                   -- Changed to NOT NULL
    [ResultUnitId]              INT             NOT NULL,                   -- Changed to NOT NULL
    [SpecialtyId]               INT             NULL,                       -- NEW - Medical specialty
    
    -- TEST DETAILS
    [Description]               NVARCHAR (MAX)  NULL,                       -- NEW - Test description
    [ReferenceRange]            NVARCHAR (500)  NULL,                       -- NEW - Normal range
    [NormalValueMin]            DECIMAL(18, 4)  NULL,                       -- NEW - Min normal value
    [NormalValueMax]            DECIMAL(18, 4)  NULL,                       -- NEW - Max normal value
    [CriticalValueMin]          DECIMAL(18, 4)  NULL,                       -- NEW - Critical low
    [CriticalValueMax]          DECIMAL(18, 4)  NULL,                       -- NEW - Critical high
    
    -- SAMPLE HANDLING
    [SampleVolume]              DECIMAL(10, 2)  NULL,                       -- NEW - Volume needed (ml)
    [SamplePreservative]        VARCHAR (100)   NULL,                       -- NEW - Tube type
    [SpecialHandling]           NVARCHAR (MAX)  NULL,                       -- NEW - Special instructions
    [StableHours]               INT             NULL,                       -- NEW - Sample stability (hours)
    [FasteringRequired]         BIT             NOT NULL DEFAULT 0,         -- NEW - Fasting needed
    [FasteringHours]            INT             NULL,                       -- NEW - Fasting duration
    
    -- TURNAROUND TIME
    [TurnaroundTimeHours]       INT             NOT NULL DEFAULT 24,        -- NEW - TAT
    [UrgentTAT]                 INT             NULL,                       -- NEW - Urgent TAT
    [ReportGenerationType]      VARCHAR (50)    NULL,                       -- NEW - Automatic, Manual, etc.
    
    -- CLINICAL INFORMATION
    [ClinicalIndication]        NVARCHAR (MAX)  NULL,                       -- NEW - When to order
    [RelatedTests]              NVARCHAR (MAX)  NULL,                       -- NEW - Recommended tests
    [Interpretation]            NVARCHAR (MAX)  NULL,                       -- NEW - How to interpret
    [RequiresCertification]     BIT             NOT NULL DEFAULT 0,         -- NEW - Need certification
    
    -- PRICING
    [TestCost]                  DECIMAL(18, 2)  NULL,                       -- NEW - Lab cost
    [PatientCharges]            DECIMAL(18, 2)  NULL,                       -- NEW - Patient billing
    [InsuranceCharges]          DECIMAL(18, 2)  NULL,                       -- NEW - Insurance billing
    [CorporateCharges]          DECIMAL(18, 2)  NULL,                       -- NEW - Corporate billing
    [GSTPct]                    DECIMAL(5, 2)   NULL,                       -- NEW - GST %
    
    -- STATUS
    [IsActive]                  BIT             NOT NULL DEFAULT 1,
    [IsDeleted]                 BIT             NOT NULL DEFAULT 0,         -- NEW - Soft delete
    [IsDiscontinued]            BIT             NOT NULL DEFAULT 0,         -- NEW - Test discontinued
    
    -- AUDIT
    [CreatedBy]                 BIGINT          NOT NULL,                   -- NEW - Audit
    [CreatedOn]                 DATETIME2(7)    NOT NULL DEFAULT GETDATE(), -- NEW - Audit
    [ModifiedBy]                BIGINT          NULL,                       -- NEW - Audit
    [ModifiedOn]                DATETIME2(7)    NULL,                       -- NEW - Audit
    [RowVersion]                ROWVERSION      NOT NULL,                   -- NEW - Optimistic locking
    
    -- CONSTRAINTS
    PRIMARY KEY CLUSTERED ([LabTestId] ASC),
    
    CONSTRAINT [FK_LabTest_TestCategory]
        FOREIGN KEY ([TestCategoryId]) REFERENCES [dbo].[TestCategory] ([TestCategoryId]),
    CONSTRAINT [FK_LabTest_LabSection]
        FOREIGN KEY ([LabSectionId]) REFERENCES [dbo].[LabSection] ([LabSectionId]),
    CONSTRAINT [FK_LabTest_SampleType]
        FOREIGN KEY ([SampleTypeId]) REFERENCES [dbo].[SampleType] ([SampleTypeId]),
    CONSTRAINT [FK_LabTest_ResultUnit]
        FOREIGN KEY ([ResultUnitId]) REFERENCES [dbo].[ResultUnit] ([ResultUnitId]),
    CONSTRAINT [FK_LabTest_Specialty]
        FOREIGN KEY ([SpecialtyId]) REFERENCES [dbo].[Specialty] ([SpecialtyId]),
    CONSTRAINT [FK_LabTest_CreatedBy]
        FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[ApplicationUser] ([UserId]),
    CONSTRAINT [FK_LabTest_ModifiedBy]
        FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[ApplicationUser] ([UserId]),
    
    -- CHECK CONSTRAINTS
    CONSTRAINT [CK_LabTest_NormalRange]
        CHECK ([NormalValueMin] IS NULL OR [NormalValueMax] IS NULL OR [NormalValueMin] <= [NormalValueMax]),
    CONSTRAINT [CK_LabTest_CriticalRange]
        CHECK ([CriticalValueMin] IS NULL OR [CriticalValueMax] IS NULL OR [CriticalValueMin] <= [CriticalValueMax]),
    CONSTRAINT [CK_LabTest_SampleVolume]
        CHECK ([SampleVolume] IS NULL OR [SampleVolume] > 0),
    CONSTRAINT [CK_LabTest_TAT]
        CHECK ([TurnaroundTimeHours] > 0),
    CONSTRAINT [CK_LabTest_Fasting]
        CHECK ([FasteringRequired] = 0 OR [FasteringHours] IS NOT NULL),
    CONSTRAINT [CK_LabTest_Pricing]
        CHECK ([TestCost] IS NULL OR [TestCost] >= 0),
    CONSTRAINT [CK_LabTest_GST]
        CHECK ([GSTPct] IS NULL OR ([GSTPct] >= 0 AND [GSTPct] <= 100)),
    
    UNIQUE NONCLUSTERED ([TestCode] ASC)
);

-- CREATE INDEXES
CREATE NONCLUSTERED INDEX [IX_LabTest_TestCode] ON [dbo].[LabTest]([TestCode]);
CREATE NONCLUSTERED INDEX [IX_LabTest_TestName] ON [dbo].[LabTest]([TestName]);
CREATE NONCLUSTERED INDEX [IX_LabTest_TestCategoryId] ON [dbo].[LabTest]([TestCategoryId]);
CREATE NONCLUSTERED INDEX [IX_LabTest_LabSectionId] ON [dbo].[LabTest]([LabSectionId]);
CREATE NONCLUSTERED INDEX [IX_LabTest_SampleTypeId] ON [dbo].[LabTest]([SampleTypeId]);

-- Filtered indexes
CREATE NONCLUSTERED INDEX [IX_LabTest_Active]
    ON [dbo].[LabTest]([TestName], [TestCategoryId])
    WHERE [IsDeleted] = 0 AND [IsActive] = 1 AND [IsDiscontinued] = 0;

CREATE NONCLUSTERED INDEX [IX_LabTest_Search]
    ON [dbo].[LabTest]([TestCode], [TestName])
    INCLUDE ([TestCategoryId], [LabSectionId], [SampleTypeId], [TurnaroundTimeHours]);

-- ============================================================================
-- CHANGE SUMMARY
-- ============================================================================
-- ADDED: NOT NULL to TestCode, TestName, TestCategoryId, LabSectionId, SampleTypeId, ResultUnitId
-- ADDED: DisplayName, Abbreviation, SpecialtyId
-- ADDED: Description, ReferenceRange, NormalValueMin, NormalValueMax, CriticalValueMin, CriticalValueMax
-- ADDED: SampleVolume, SamplePreservative, SpecialHandling, StableHours, FasteringRequired, FasteringHours
-- ADDED: TurnaroundTimeHours, UrgentTAT, ReportGenerationType
-- ADDED: ClinicalIndication, RelatedTests, Interpretation, RequiresCertification
-- ADDED: TestCost, PatientCharges, InsuranceCharges, CorporateCharges, GSTPct
-- ADDED: IsDiscontinued, CreatedBy, CreatedOn, ModifiedBy, ModifiedOn, IsDeleted, RowVersion
-- ADDED: ALL missing FK constraints (Specialty added)
-- ADDED: Comprehensive CHECK constraints for range and pricing validation
-- ADDED: Multiple indexes for lab test search and filtering
-- ============================================================================
