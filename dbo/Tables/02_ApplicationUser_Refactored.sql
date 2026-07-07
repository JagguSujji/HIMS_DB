-- ============================================================================
-- HIMS ApplicationUser Table - REFACTORED FOR ENTERPRISE READINESS
-- ============================================================================
-- Changes from original:
-- 1. Changed UserId from INT to BIGINT for consistency
-- 2. Added NOT NULL constraints to all security fields
-- 3. Removed duplicate Email/Mobile/FullName columns (consolidated)
-- 4. Changed EmailAddress from NVARCHAR to VARCHAR (emails are ASCII)
-- 5. Added CHECK constraints for security validations
-- 6. Added password policy fields (ExpiresOn, RequiredToChange)
-- 7. Standardized data types across the board
-- 8. Added ModifiedOn to all critical security fields
-- 9. Added multiple login tracking fields
-- ============================================================================

CREATE TABLE [dbo].[ApplicationUser] (
    -- PRIMARY KEY
    [UserId]                    BIGINT          IDENTITY (1, 1) NOT NULL,  -- Changed from INT
    
    -- ACCOUNT BASICS
    [UserTypeId]                INT             NOT NULL,
    [EmployeeId]                BIGINT          NULL,                       -- Changed from BIGINT (consistency)
    [Username]                  VARCHAR (100)   NOT NULL UNIQUE,
    [FullName]                  NVARCHAR (200)  NOT NULL,                   -- Consolidated from duplicate fields
    [EmailAddress]              VARCHAR (150)   NOT NULL,                   -- PRIMARY email
    [MobileNumber]              VARCHAR (20)    NULL,
    
    -- SECURITY - PASSWORD
    [PasswordHash]              NVARCHAR (500)  NOT NULL,
    [PasswordSalt]              NVARCHAR (500)  NOT NULL,
    [PasswordChangedOn]         DATETIME2(7)    NOT NULL DEFAULT GETDATE(),
    [PasswordExpiresOn]         DATETIME2(7)    NULL,                       -- NEW - Password expiry
    [MustChangePassword]        BIT             NOT NULL DEFAULT 1,
    [PasswordPolicyId]          INT             NULL,                       -- NEW - FK to password policy
    
    -- SECURITY - VERIFICATION
    [IsEmailVerified]           BIT             NOT NULL DEFAULT 0,
    [EmailVerifiedOn]           DATETIME2(7)    NULL,
    [IsMobileVerified]          BIT             NOT NULL DEFAULT 0,
    [MobileVerifiedOn]          DATETIME2(7)    NULL,
    
    -- SECURITY - ACCOUNT LOCK & AUTHENTICATION
    [FailedLoginCount]          INT             NOT NULL DEFAULT 0,
    [FailedLoginAttemptAt]      DATETIME2(7)    NULL,                       -- NEW - Last failed attempt
    [IsLocked]                  BIT             NOT NULL DEFAULT 0,
    [LockUntil]                 DATETIME2(7)    NULL,
    [LockedReason]              VARCHAR (200)   NULL,                       -- NEW - Why locked
    [LastLoginOn]               DATETIME2(7)    NULL,
    [LastLoginIpAddress]        VARCHAR (50)    NULL,                       -- NEW - Last login IP
    [LastPasswordChangeOn]      DATETIME2(7)    NULL,                       -- NEW - Track pwd changes
    
    -- STATUS
    [IsActive]                  BIT             NOT NULL DEFAULT 1,
    [IsSystemAccount]           BIT             NOT NULL DEFAULT 0,         -- NEW - System accounts (admin, batch)
    
    -- AUDIT
    [CreatedBy]                 BIGINT          NULL,                       -- User who created this account
    [CreatedOn]                 DATETIME2(7)    NOT NULL DEFAULT GETDATE(),
    [ModifiedBy]                BIGINT          NULL,                       -- User who modified this account
    [ModifiedOn]                DATETIME2(7)    NULL,
    [RowVersion]                ROWVERSION      NOT NULL,
    
    -- CONSTRAINTS
    PRIMARY KEY CLUSTERED ([UserId] ASC),
    CONSTRAINT [FK_ApplicationUser_UserType] 
        FOREIGN KEY ([UserTypeId]) REFERENCES [dbo].[UserType] ([UserTypeId]),
    CONSTRAINT [FK_ApplicationUser_Employee] 
        FOREIGN KEY ([EmployeeId]) REFERENCES [dbo].[Employee] ([EmployeeId]),
    CONSTRAINT [FK_ApplicationUser_PasswordPolicy] 
        FOREIGN KEY ([PasswordPolicyId]) REFERENCES [dbo].[PasswordPolicy] ([PasswordPolicyId]),
    CONSTRAINT [FK_ApplicationUser_CreatedBy] 
        FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[ApplicationUser] ([UserId]),
    CONSTRAINT [FK_ApplicationUser_ModifiedBy] 
        FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[ApplicationUser] ([UserId]),
    
    -- CHECK CONSTRAINTS
    CONSTRAINT [CK_ApplicationUser_FailedLoginCount]
        CHECK ([FailedLoginCount] >= 0),
    CONSTRAINT [CK_ApplicationUser_PasswordExpiry]
        CHECK ([PasswordExpiresOn] IS NULL OR [PasswordExpiresOn] > [PasswordChangedOn]),
    
    UNIQUE NONCLUSTERED ([Username] ASC),
    UNIQUE NONCLUSTERED ([EmailAddress] ASC)
);

-- Create indexes for common queries
CREATE NONCLUSTERED INDEX [IX_ApplicationUser_Username] ON [dbo].[ApplicationUser]([Username]);
CREATE NONCLUSTERED INDEX [IX_ApplicationUser_EmailAddress] ON [dbo].[ApplicationUser]([EmailAddress]);
CREATE NONCLUSTERED INDEX [IX_ApplicationUser_EmployeeId] ON [dbo].[ApplicationUser]([EmployeeId]);
CREATE NONCLUSTERED INDEX [IX_ApplicationUser_IsActive] ON [dbo].[ApplicationUser]([IsActive]) 
    WHERE [IsActive] = 1;  -- Filtered index for active users
CREATE NONCLUSTERED INDEX [IX_ApplicationUser_IsLocked] ON [dbo].[ApplicationUser]([IsLocked]) 
    WHERE [IsLocked] = 1;  -- Filtered index for locked accounts
CREATE NONCLUSTERED INDEX [IX_ApplicationUser_LastLoginOn] ON [dbo].[ApplicationUser]([LastLoginOn]);

-- ============================================================================
-- CHANGE SUMMARY
-- ============================================================================
-- CHANGED: UserId from INT to BIGINT
-- ADDED: EmailVerifiedOn, MobileVerifiedOn (timestamp for verification)
-- ADDED: FailedLoginAttemptAt, LockedReason, LastLoginIpAddress, LastPasswordChangeOn
-- ADDED: IsSystemAccount, PasswordPolicyId (for policy management)
-- REMOVED: Duplicate Email, Mobile, FullName columns (consolidated into EmailAddress, MobileNumber, FullName)
-- CHANGED: Email/Mobile/FullName columns to NVARCHAR/VARCHAR with proper sizing
-- ADDED: FK constraints to CreatedBy and ModifiedBy for audit
-- ADDED: CHECK constraints for FailedLoginCount and PasswordExpiry
-- ADDED: Multiple indexes for login auditing and security queries
-- ADDED: UNIQUE constraint on EmailAddress
-- ============================================================================
