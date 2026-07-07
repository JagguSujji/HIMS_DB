-- ============================================================================
-- HIMS Patient Table - REFACTORED FOR ENTERPRISE READINESS
-- ============================================================================
-- Changes from original:
-- 1. Changed PatientId from INT IDENTITY to BIGINT IDENTITY
-- 2. Added NOT NULL constraints to critical fields
-- 3. Made UHID UNIQUE NOT NULL (patient identifier)
-- 4. Changed RegistrationDate to DATETIME2(7) for precision
-- 5. Added comprehensive audit columns (CreatedBy, CreatedOn, ModifiedBy, ModifiedOn)
-- 6. Added IsDeleted for soft delete pattern
-- 7. Added RowVersion for optimistic locking
-- 8. Added missing emergency contact fields
-- 9. Added healthcare-specific fields (AadhaarNumber, PANNumber, GuardianName, etc.)
-- 10. Added FK constraints to lookup tables (Gender, BloodGroup, etc.)
-- 11. Added CHECK constraints for date validation
-- 12. Changed Address from TEXT to NVARCHAR(MAX)
-- ============================================================================

CREATE TABLE [dbo].[Patient] (
    -- PRIMARY KEY AND IDENTIFIERS
    [PatientId]                 BIGINT          IDENTITY (1, 1) NOT NULL,  -- Changed from INT
    [UHID]                      VARCHAR (50)    NOT NULL UNIQUE,            -- Unique Health ID
    
    -- PERSONAL INFORMATION
    [FirstName]                 NVARCHAR (100)  NOT NULL,                   -- Changed to NOT NULL
    [MiddleName]                NVARCHAR (100)  NULL,
    [LastName]                  NVARCHAR (100)  NOT NULL,                   -- Changed to NOT NULL
    [DateOfBirth]               DATE            NOT NULL,                   -- Changed to NOT NULL
    [Age]                       INT             NULL,                       -- Calculated from DOB
    [GenderId]                  INT             NOT NULL,                   -- Changed to NOT NULL
    [MaritalStatusId]           INT             NULL,
    [Religion]                  VARCHAR (50)    NULL,
    [Nationality]              VARCHAR (100)   NULL,
    [NationalityId]            INT             NULL,
    [Occupation]               VARCHAR (100)   NULL,
    [EducationLevel]           VARCHAR (50)    NULL,
    
    -- CONTACT INFORMATION
    [Mobile]                    VARCHAR (20)    NOT NULL,                   -- Changed to NOT NULL
    [AlternativeMobile]         VARCHAR (20)    NULL,
    [Email]                     VARCHAR (150)   NULL,
    [Address]                   NVARCHAR (MAX)  NULL,                       -- Changed from TEXT
    [City]                      VARCHAR (100)   NULL,
    [State]                     VARCHAR (100)   NULL,
    [PostalCode]                VARCHAR (20)    NULL,
    [Country]                   VARCHAR (100)   NULL,
    
    -- EMERGENCY CONTACT INFORMATION
    [EmergencyContactName]      NVARCHAR (100)  NOT NULL,                   -- Changed to NOT NULL
    [EmergencyContactRelation]  VARCHAR (50)    NOT NULL,
    [EmergencyContactPhone]     VARCHAR (20)    NOT NULL,                   -- New field
    [EmergencyContactAddress]   NVARCHAR (MAX)  NULL,                       -- New field
    
    -- GUARDIAN INFORMATION (for minors)
    [GuardianName]              NVARCHAR (100)  NULL,
    [GuardianPhone]             VARCHAR (20)    NULL,
    [GuardianRelation]          VARCHAR (50)    NULL,
    
    -- IDENTIFICATION DOCUMENTS
    [AadhaarNumber]             VARCHAR (20)    NULL UNIQUE,
    [PANNumber]                 VARCHAR (20)    NULL UNIQUE,
    [DrivingLicenseNumber]      VARCHAR (50)    NULL UNIQUE,
    [PassportNumber]            VARCHAR (50)    NULL UNIQUE,
    
    -- HEALTH INFORMATION
    [BloodGroupId]              INT             NULL,
    [BloodDonor]                BIT             NOT NULL DEFAULT 0,
    [OrganDonor]                BIT             NOT NULL DEFAULT 0,
    [AllergyInformation]        NVARCHAR (MAX)  NULL,                       -- New field for critical safety
    [PreferredLanguageId]       INT             NULL,
    
    -- INSURANCE INFORMATION
    [InsuranceProviderRef]      VARCHAR (100)   NULL,                       -- New field
    [InsurancePolicyNumber]     VARCHAR (50)    NULL,
    [InsurancePolicyStartDate]  DATE            NULL,
    [InsurancePolicyEndDate]    DATE            NULL,
    
    -- STATUS INFORMATION
    [PatientStatus]             NVARCHAR (30)   NOT NULL DEFAULT 'ACTIVE',
    [IsActive]                  BIT             NOT NULL DEFAULT 1,
    [IsDeceased]                BIT             NOT NULL DEFAULT 0,
    [DeceasedDate]              DATETIME2(7)    NULL,                       -- New field
    [IsDeleted]                 BIT             NOT NULL DEFAULT 0,         -- Soft delete flag
    
    -- REGISTRATION & AUDIT INFORMATION
    [RegistrationDate]          DATETIME2(7)    NOT NULL DEFAULT GETDATE(), -- Changed from DATETIME
    [CreatedBy]                 BIGINT          NOT NULL,                   -- NEW - Audit
    [CreatedOn]                 DATETIME2(7)    NOT NULL DEFAULT GETDATE(), -- NEW - Audit
    [ModifiedBy]                BIGINT          NULL,                       -- NEW - Audit
    [ModifiedOn]                DATETIME2(7)    NULL,                       -- NEW - Audit
    [RowVersion]                ROWVERSION      NOT NULL,                   -- NEW - Optimistic locking
    
    -- CONSTRAINTS
    PRIMARY KEY CLUSTERED ([PatientId] ASC),
    CONSTRAINT [FK_Patient_Gender] 
        FOREIGN KEY ([GenderId]) REFERENCES [dbo].[Gender] ([GenderId]),
    CONSTRAINT [FK_Patient_BloodGroup] 
        FOREIGN KEY ([BloodGroupId]) REFERENCES [dbo].[BloodGroup] ([BloodGroupId]),
    CONSTRAINT [FK_Patient_MaritalStatus] 
        FOREIGN KEY ([MaritalStatusId]) REFERENCES [dbo].[MaritalStatus] ([MaritalStatusId]),
    CONSTRAINT [FK_Patient_Nationality] 
        FOREIGN KEY ([NationalityId]) REFERENCES [dbo].[Nationality] ([NationalityId]),
    CONSTRAINT [FK_Patient_CreatedBy] 
        FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[ApplicationUser] ([UserId]),
    CONSTRAINT [FK_Patient_ModifiedBy] 
        FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[ApplicationUser] ([UserId]),
    
    -- CHECK CONSTRAINTS
    CONSTRAINT [CK_Patient_DateOfBirth]
        CHECK ([DateOfBirth] <= CAST(GETDATE() AS DATE)),                   -- Cannot be future date
    CONSTRAINT [CK_Patient_Age]
        CHECK ([Age] >= 0 AND [Age] <= 150),                               -- Reasonable age range
    CONSTRAINT [CK_Patient_InsuranceDates]
        CHECK ([InsurancePolicyStartDate] <= [InsurancePolicyEndDate]),    -- Date range validation
    
    UNIQUE NONCLUSTERED ([UHID] ASC)                                       -- UHID must be unique
);

-- Create indexes for better query performance
CREATE NONCLUSTERED INDEX [IX_Patient_UHID] ON [dbo].[Patient]([UHID]);
CREATE NONCLUSTERED INDEX [IX_Patient_FirstName_LastName] ON [dbo].[Patient]([FirstName], [LastName]);
CREATE NONCLUSTERED INDEX [IX_Patient_Mobile] ON [dbo].[Patient]([Mobile]);
CREATE NONCLUSTERED INDEX [IX_Patient_Email] ON [dbo].[Patient]([Email]);
CREATE NONCLUSTERED INDEX [IX_Patient_CreatedOn] ON [dbo].[Patient]([CreatedOn]);
CREATE NONCLUSTERED INDEX [IX_Patient_IsDeleted] ON [dbo].[Patient]([IsDeleted]) 
    WHERE [IsDeleted] = 0;                                                  -- Filtered index for active records

CREATE NONCLUSTERED INDEX [IX_Patient_Search]
    ON [dbo].[Patient]([UHID], [FirstName], [LastName])
    INCLUDE ([DateOfBirth], [Mobile], [Email], [IsActive]);

-- ============================================================================
-- CHANGE SUMMARY
-- ============================================================================
-- ADDED: MiddleName, Occupation, EducationLevel, AlternativeMobile, City, State, PostalCode, Country
-- ADDED: EmergencyContactPhone, EmergencyContactAddress (critical missing fields)
-- ADDED: GuardianName, GuardianPhone, GuardianRelation (for minors support)
-- ADDED: AadhaarNumber, PANNumber, DrivingLicenseNumber, PassportNumber (ID documents)
-- ADDED: BloodDonor, OrganDonor, AllergyInformation (healthcare critical)
-- ADDED: InsuranceProviderRef, InsurancePolicyNumber, dates (insurance tracking)
-- ADDED: DeceasedDate (precise deceased tracking)
-- ADDED: CreatedBy, CreatedOn, ModifiedBy, ModifiedOn, IsDeleted, RowVersion (audit & locking)
-- CHANGED: PatientId from INT to BIGINT
-- CHANGED: RegistrationDate from DATETIME to DATETIME2(7)
-- CHANGED: Address from TEXT to NVARCHAR(MAX)
-- CHANGED: Made FirstName, LastName, Mobile, UHID, EmergencyContactName, EmergencyContactRelation, EmergencyContactPhone NOT NULL
-- ADDED: FK constraints for audit columns
-- ADDED: CHECK constraints for date validation
-- ADDED: Comprehensive indexes for search and reporting
-- ============================================================================
