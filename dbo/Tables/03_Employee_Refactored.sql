-- ============================================================================
-- HIMS Employee Table - REFACTORED FOR ENTERPRISE READINESS
-- ============================================================================
-- Changes from original:
-- 1. EmployeeId already BIGINT (good)
-- 2. Added NOT NULL constraints to critical fields
-- 3. Changed BloodGroup to BloodGroupId with FK
-- 4. Added missing fields (qualification, specialization, license)
-- 5. Added medical professional specific fields
-- 6. Standardized datetime fields to DATETIME2(7)
-- 7. Added address fields for employee
-- 8. Added employment details (shift, department, branch)
-- ============================================================================

CREATE TABLE [dbo].[Employee] (
    -- PRIMARY KEY
    [EmployeeId]                BIGINT          IDENTITY (1, 1) NOT NULL,
    [EmployeeNumber]            VARCHAR (30)    NOT NULL UNIQUE,
    
    -- PERSONAL INFORMATION
    [FirstName]                 NVARCHAR (100)  NOT NULL,
    [MiddleName]                NVARCHAR (100)  NULL,
    [LastName]                  NVARCHAR (100)  NOT NULL,
    [DateOfBirth]               DATE            NOT NULL,
    [Age]                       INT             NULL,
    [GenderId]                  INT             NOT NULL,
    [MaritalStatus]             VARCHAR (50)    NULL,
    [Religion]                  VARCHAR (50)    NULL,
    [Nationality]               VARCHAR (100)   NULL,
    
    -- CONTACT INFORMATION
    [EmailAddress]              VARCHAR (150)   NOT NULL UNIQUE,
    [MobileNumber]              VARCHAR (20)    NOT NULL,
    [AlternativePhone]          VARCHAR (20)    NULL,
    [Address]                   NVARCHAR (MAX)  NULL,
    [City]                      VARCHAR (100)   NULL,
    [State]                     VARCHAR (100)   NULL,
    [PostalCode]                VARCHAR (20)    NULL,
    [Country]                   VARCHAR (100)   NULL,
    
    -- EMERGENCY CONTACT
    [EmergencyContactName]      NVARCHAR (100)  NOT NULL,
    [EmergencyContactNo]        VARCHAR (20)    NOT NULL,
    [EmergencyContactRelation]  VARCHAR (50)    NULL,
    
    -- EMPLOYMENT INFORMATION
    [EmploymentTypeId]          INT             NOT NULL,
    [DesignationId]             INT             NOT NULL,
    [DepartmentId]              BIGINT          NULL,                       -- NEW - Department assignment
    [BranchId]                  BIGINT          NULL,                       -- NEW - Branch assignment
    [JoiningDate]               DATE            NOT NULL,
    [RelievingDate]             DATE            NULL,
    [EmploymentStatus]          VARCHAR (50)    NOT NULL DEFAULT 'ACTIVE',
    
    -- MEDICAL PROFESSIONAL INFORMATION (if applicable)
    [RegistrationNumber]        VARCHAR (50)    NULL,                       -- NEW - Doctor/Nurse registration
    [SpecializationId]          INT             NULL,                       -- NEW - Doctor specialization
    [QualificationId]           INT             NULL,                       -- NEW - Educational qualification
    [LicenseNumber]             VARCHAR (50)    NULL,                       -- NEW - Professional license
    [LicenseExpiryDate]         DATE            NULL,                       -- NEW - License expiry
    [IsDoctor]                  BIT             NOT NULL DEFAULT 0,         -- NEW - Quick lookup
    [IsNurse]                   BIT             NOT NULL DEFAULT 0,         -- NEW - Quick lookup
    
    -- IDENTIFICATION & COMPLIANCE
    [AadhaarNumber]             VARCHAR (20)    NULL UNIQUE,
    [PANNumber]                 VARCHAR (20)    NULL UNIQUE,
    [BloodGroupId]              INT             NULL,                       -- Changed from BloodGroup VARCHAR
    [BankAccountNumber]         VARCHAR (50)    NULL,                       -- NEW - For salary
    [BankIFSCCode]              VARCHAR (20)    NULL,                       -- NEW - For salary
    [BankName]                  VARCHAR (100)   NULL,                       -- NEW - For salary
    
    -- STATUS
    [IsActive]                  BIT             NOT NULL DEFAULT 1,
    [IsDeleted]                 BIT             NOT NULL DEFAULT 0,         -- NEW - Soft delete
    
    -- AUDIT & VERSIONING
    [CreatedBy]                 BIGINT          NOT NULL,
    [CreatedOn]                 DATETIME2(7)    NOT NULL DEFAULT GETDATE(),
    [ModifiedBy]                BIGINT          NULL,
    [ModifiedOn]                DATETIME2(7)    NULL,
    [RowVersion]                ROWVERSION      NOT NULL,
    
    -- CONSTRAINTS
    PRIMARY KEY CLUSTERED ([EmployeeId] ASC),
    CONSTRAINT [FK_Employee_Designation] 
        FOREIGN KEY ([DesignationId]) REFERENCES [dbo].[Designation] ([DesignationId]),
    CONSTRAINT [FK_Employee_EmploymentType] 
        FOREIGN KEY ([EmploymentTypeId]) REFERENCES [dbo].[EmploymentType] ([EmploymentTypeId]),
    CONSTRAINT [FK_Employee_Gender] 
        FOREIGN KEY ([GenderId]) REFERENCES [dbo].[Gender] ([GenderId]),
    CONSTRAINT [FK_Employee_BloodGroup] 
        FOREIGN KEY ([BloodGroupId]) REFERENCES [dbo].[BloodGroup] ([BloodGroupId]),
    CONSTRAINT [FK_Employee_Department] 
        FOREIGN KEY ([DepartmentId]) REFERENCES [dbo].[Department] ([DepartmentId]),
    CONSTRAINT [FK_Employee_Branch] 
        FOREIGN KEY ([BranchId]) REFERENCES [dbo].[Branch] ([BranchId]),
    CONSTRAINT [FK_Employee_Specialization] 
        FOREIGN KEY ([SpecializationId]) REFERENCES [dbo].[Specialization] ([SpecializationId]),
    CONSTRAINT [FK_Employee_Qualification] 
        FOREIGN KEY ([QualificationId]) REFERENCES [dbo].[Qualification] ([QualificationId]),
    CONSTRAINT [FK_Employee_CreatedBy] 
        FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[ApplicationUser] ([UserId]),
    CONSTRAINT [FK_Employee_ModifiedBy] 
        FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[ApplicationUser] ([UserId]),
    
    -- CHECK CONSTRAINTS
    CONSTRAINT [CK_Employee_DateOfBirth]
        CHECK ([DateOfBirth] <= CAST(GETDATE() AS DATE)),
    CONSTRAINT [CK_Employee_JoiningDate]
        CHECK ([JoiningDate] <= CAST(GETDATE() AS DATE)),
    CONSTRAINT [CK_Employee_RelievingDate]
        CHECK ([RelievingDate] IS NULL OR [RelievingDate] >= [JoiningDate]),
    CONSTRAINT [CK_Employee_LicenseExpiry]
        CHECK ([LicenseExpiryDate] IS NULL OR [LicenseExpiryDate] >= CAST(GETDATE() AS DATE)),
    
    UNIQUE NONCLUSTERED ([EmployeeNumber] ASC)
);

-- Create indexes
CREATE NONCLUSTERED INDEX [IX_Employee_EmployeeNumber] ON [dbo].[Employee]([EmployeeNumber]);
CREATE NONCLUSTERED INDEX [IX_Employee_EmailAddress] ON [dbo].[Employee]([EmailAddress]);
CREATE NONCLUSTERED INDEX [IX_Employee_MobileNumber] ON [dbo].[Employee]([MobileNumber]);
CREATE NONCLUSTERED INDEX [IX_Employee_DepartmentId] ON [dbo].[Employee]([DepartmentId]);
CREATE NONCLUSTERED INDEX [IX_Employee_BranchId] ON [dbo].[Employee]([BranchId]);
CREATE NONCLUSTERED INDEX [IX_Employee_IsDoctor] ON [dbo].[Employee]([IsDoctor]) 
    WHERE [IsDoctor] = 1;
CREATE NONCLUSTERED INDEX [IX_Employee_IsNurse] ON [dbo].[Employee]([IsNurse]) 
    WHERE [IsNurse] = 1;
CREATE NONCLUSTERED INDEX [IX_Employee_IsActive] ON [dbo].[Employee]([IsActive]) 
    WHERE [IsActive] = 1 AND [IsDeleted] = 0;
CREATE NONCLUSTERED INDEX [IX_Employee_Search]
    ON [dbo].[Employee]([FirstName], [LastName])
    INCLUDE ([EmployeeNumber], [EmailAddress], [MobileNumber]);

-- ============================================================================
-- CHANGE SUMMARY
-- ============================================================================
-- ADDED: MiddleName, Age, MaritalStatus, Religion, Nationality
-- ADDED: AlternativePhone, Address, City, State, PostalCode, Country
-- ADDED: EmergencyContactRelation, DepartmentId, BranchId
-- ADDED: RegistrationNumber, SpecializationId, QualificationId, LicenseNumber, LicenseExpiryDate, IsDoctor, IsNurse
-- ADDED: BankAccountNumber, BankIFSCCode, BankName (salary processing)
-- ADDED: IsDeleted (soft delete pattern)
-- ADDED: FK constraints to Department, Branch, Specialization, Qualification, CreatedBy, ModifiedBy
-- CHANGED: BloodGroup from VARCHAR to BloodGroupId (FK)
-- ADDED: CHECK constraints for date validations
-- ADDED: UNIQUE constraint on EmailAddress
-- ADDED: Multiple indexes for search and filtering
-- ============================================================================
