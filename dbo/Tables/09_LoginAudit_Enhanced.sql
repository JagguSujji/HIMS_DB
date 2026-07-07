-- ============================================================================
-- HIMS LoginAudit Table - Already Well Designed
-- This is already enterprise-grade, adding enhancements for completeness
-- ============================================================================
-- Additions:
-- 1. Add FK constraint to ApplicationUser
-- 2. Add additional security tracking
-- 3. Add indexes for security queries
-- ============================================================================

CREATE TABLE [dbo].[LoginAudit] (
    -- PRIMARY KEY
    [LoginAuditId]              BIGINT          IDENTITY (1, 1) NOT NULL,
    
    -- LOGIN INFORMATION
    [UserId]                    BIGINT          NULL,                       -- Can be NULL for failed logins (unknown user)
    [Username]                  VARCHAR (100)   NOT NULL,                   -- Always recorded for failed attempts
    [LoginDateTime]             DATETIME2(7)    NOT NULL,
    [IsSuccessful]              BIT             NOT NULL,
    
    -- FAILURE TRACKING
    [FailureReason]             NVARCHAR (300)  NULL,                       -- Invalid password, account locked, etc.
    [FailureCode]               VARCHAR (50)    NULL,                       -- NEW - Standard error code
    
    -- DEVICE INFORMATION
    [IPAddress]                 VARCHAR (50)    NULL,
    [BrowserName]               NVARCHAR (200)  NULL,
    [BrowserVersion]            VARCHAR (50)    NULL,                       -- NEW - Browser version
    [OperatingSystem]           NVARCHAR (200)  NULL,
    [OSVersion]                 VARCHAR (50)    NULL,                       -- NEW - OS version
    [DeviceName]                NVARCHAR (200)  NULL,
    [DeviceType]                VARCHAR (50)    NULL,                       -- NEW - Mobile, Desktop, Tablet
    [UserAgent]                 NVARCHAR (MAX)  NULL,                       -- NEW - Full user agent string
    
    -- LOCATION INFORMATION
    [GeoLocation]               VARCHAR (100)   NULL,                       -- NEW - Country/City from IP
    [Latitude]                  DECIMAL(10, 8)  NULL,                       -- NEW - Geo coordinates
    [Longitude]                 DECIMAL(11, 8)  NULL,                       -- NEW - Geo coordinates
    
    -- SESSION INFORMATION
    [SessionId]                 VARCHAR (100)   NULL,                       -- NEW - Session identifier
    [TokenIssueTime]            DATETIME2(7)    NULL,                       -- NEW - Token issued time
    [TokenExpiryTime]           DATETIME2(7)    NULL,                       -- NEW - Token expiry
    
    -- AUTHENTICATION METHOD
    [AuthenticationMethod]      VARCHAR (50)    NULL,                       -- NEW - Password, SSO, MFA, etc.
    [MFAUsed]                   BIT             NOT NULL DEFAULT 0,         -- NEW - Two-factor used?
    [MFAMethod]                 VARCHAR (50)    NULL,                       -- NEW - SMS, Email, Authenticator
    
    -- AUDIT METADATA
    [CreatedOn]                 DATETIME2(7)    NOT NULL DEFAULT GETDATE(),
    [IsDeleted]                 BIT             NOT NULL DEFAULT 0,         -- NEW - Soft delete
    
    -- CONSTRAINTS
    PRIMARY KEY CLUSTERED ([LoginAuditId] ASC),
    
    CONSTRAINT [FK_LoginAudit_User]
        FOREIGN KEY ([UserId]) REFERENCES [dbo].[ApplicationUser] ([UserId]),
    
    -- CHECK CONSTRAINTS
    CONSTRAINT [CK_LoginAudit_DateLogic]
        CHECK ([TokenIssueTime] IS NULL OR [TokenExpiryTime] IS NULL OR [TokenIssueTime] <= [TokenExpiryTime]),
    CONSTRAINT [CK_LoginAudit_MFALogic]
        CHECK ([MFAUsed] = 0 OR [MFAMethod] IS NOT NULL)
);

-- CREATE INDEXES
CREATE NONCLUSTERED INDEX [IX_LoginAudit_UserId]
    ON [dbo].[LoginAudit]([UserId] ASC, [LoginDateTime] DESC);

CREATE NONCLUSTERED INDEX [IX_LoginAudit_Username]
    ON [dbo].[LoginAudit]([Username] ASC, [LoginDateTime] DESC);

CREATE NONCLUSTERED INDEX [IX_LoginAudit_LoginDateTime]
    ON [dbo].[LoginAudit]([LoginDateTime] DESC);

CREATE NONCLUSTERED INDEX [IX_LoginAudit_IPAddress]
    ON [dbo].[LoginAudit]([IPAddress] ASC, [LoginDateTime] DESC);

CREATE NONCLUSTERED INDEX [IX_LoginAudit_IsSuccessful]
    ON [dbo].[LoginAudit]([IsSuccessful] ASC, [LoginDateTime] DESC);

-- Filtered indexes for security queries
CREATE NONCLUSTERED INDEX [IX_LoginAudit_FailedLogins]
    ON [dbo].[LoginAudit]([Username], [LoginDateTime])
    WHERE [IsSuccessful] = 0 AND [LoginDateTime] >= DATEADD(DAY, -7, GETDATE());

CREATE NONCLUSTERED INDEX [IX_LoginAudit_MFAUsed]
    ON [dbo].[LoginAudit]([UserId], [LoginDateTime])
    WHERE [MFAUsed] = 1;

-- ============================================================================
-- CHANGE SUMMARY
-- ============================================================================
-- ADDED: FK constraint to ApplicationUser
-- ADDED: FailureCode (standard error codes)
-- ADDED: BrowserVersion, OSVersion, DeviceType, UserAgent
-- ADDED: GeoLocation, Latitude, Longitude (location tracking)
-- ADDED: SessionId, TokenIssueTime, TokenExpiryTime
-- ADDED: AuthenticationMethod, MFAUsed, MFAMethod
-- ADDED: IsDeleted (soft delete)
-- ADDED: CHECK constraints for logical validation
-- ADDED: Multiple indexes for security analysis queries
-- ADDED: Filtered indexes for failed login tracking and MFA usage
-- ============================================================================
