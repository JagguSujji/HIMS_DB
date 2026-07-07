-- ============================================================================
-- HIMS AuditLog Table - REFACTORED FOR ENTERPRISE READINESS
-- ============================================================================
-- Changes from original:
-- 1. Changed AuditId from INT to BIGINT IDENTITY
-- 2. Made all fields NOT NULL (except optional fields)
-- 3. Added ColumnName for precise change tracking
-- 4. Changed data types for consistency
-- 5. Added security tracking (IPAddress, SessionId, DeviceId)
-- 6. Added comprehensive indexing strategy
-- 7. Added CHECK constraints for validation
-- ============================================================================

CREATE TABLE [dbo].[AuditLog] (
    -- PRIMARY KEY
    [AuditLogId]                BIGINT          IDENTITY (1, 1) NOT NULL,  -- Changed from INT, now auto-generated
    
    -- AUDIT CONTEXT
    [TableName]                 VARCHAR (128)   NOT NULL,                   -- Table that was modified
    [RecordId]                  BIGINT          NOT NULL,                   -- ID of modified record
    [ColumnName]                VARCHAR (128)   NOT NULL,                   -- NEW - Specific column changed
    [Action]                    VARCHAR (10)    NOT NULL,                   -- INSERT, UPDATE, DELETE
    
    -- OLD AND NEW VALUES
    [OldValue]                  NVARCHAR (MAX)  NULL,                       -- Previous value
    [NewValue]                  NVARCHAR (MAX)  NULL,                       -- New value
    [ValueDataType]             VARCHAR (50)    NULL,                       -- NEW - Data type of value
    
    -- AUDIT TRAIL
    [ChangedOn]                 DATETIME2(7)    NOT NULL DEFAULT GETDATE(), -- Changed from DATETIME
    [ChangedBy]                 BIGINT          NOT NULL,                   -- User who made change
    [ChangedByUsername]         VARCHAR (100)   NULL,                       -- NEW - Username for quick lookup
    
    -- SECURITY TRACKING
    [IPAddress]                 VARCHAR (50)    NULL,                       -- Client IP
    [SessionId]                 VARCHAR (100)   NULL,                       -- Session identifier
    [DeviceId]                  VARCHAR (100)   NULL,                       -- NEW - Device fingerprint
    [BrowserInfo]               VARCHAR (200)   NULL,                       -- NEW - Browser details
    [DatabaseUser]              VARCHAR (128)   NULL,                       -- NEW - SQL login used
    
    -- TRANSACTION CONTEXT
    [TransactionId]             VARCHAR (100)   NULL,                       -- NEW - Batch transaction ID
    [BatchNumber]               BIGINT          NULL,                       -- NEW - For bulk operations
    [SequenceNumber]            INT             NULL,                       -- NEW - Order in batch
    
    -- CONSTRAINTS
    PRIMARY KEY CLUSTERED ([AuditLogId] ASC),
    
    CONSTRAINT [FK_AuditLog_User]
        FOREIGN KEY ([ChangedBy]) REFERENCES [dbo].[ApplicationUser] ([UserId]),
    
    -- CHECK CONSTRAINTS
    CONSTRAINT [CK_AuditLog_Action]
        CHECK ([Action] IN ('INSERT', 'UPDATE', 'DELETE', 'MODIFY')),
    CONSTRAINT [CK_AuditLog_TableName]
        CHECK (LEN([TableName]) > 0),
    CONSTRAINT [CK_AuditLog_ColumnName]
        CHECK (LEN([ColumnName]) > 0),
    CONSTRAINT [CK_AuditLog_RequiredValues]
        CHECK (
            ([Action] = 'INSERT' AND [OldValue] IS NULL AND [NewValue] IS NOT NULL) OR
            ([Action] = 'UPDATE' AND [OldValue] IS NOT NULL AND [NewValue] IS NOT NULL) OR
            ([Action] = 'DELETE' AND [OldValue] IS NOT NULL AND [NewValue] IS NULL) OR
            ([Action] = 'MODIFY' AND [NewValue] IS NOT NULL)
        )
);

-- CREATE INDEXES FOR COMMON AUDIT QUERIES
CREATE NONCLUSTERED INDEX [IX_AuditLog_TableName_RecordId]
    ON [dbo].[AuditLog]([TableName] ASC, [RecordId] ASC)
    INCLUDE ([Action], [ChangedOn], [ChangedBy]);

CREATE NONCLUSTERED INDEX [IX_AuditLog_ChangedOn]
    ON [dbo].[AuditLog]([ChangedOn] DESC)
    INCLUDE ([TableName], [RecordId], [Action], [ChangedBy]);

CREATE NONCLUSTERED INDEX [IX_AuditLog_ChangedBy]
    ON [dbo].[AuditLog]([ChangedBy] ASC, [ChangedOn] DESC);

CREATE NONCLUSTERED INDEX [IX_AuditLog_Action]
    ON [dbo].[AuditLog]([Action] ASC, [ChangedOn] DESC);

CREATE NONCLUSTERED INDEX [IX_AuditLog_IPAddress]
    ON [dbo].[AuditLog]([IPAddress] ASC, [ChangedOn] DESC);

-- Filtered indexes for high-volume queries
CREATE NONCLUSTERED INDEX [IX_AuditLog_RecentChanges]
    ON [dbo].[AuditLog]([TableName], [RecordId])
    WHERE [ChangedOn] >= DATEADD(DAY, -30, GETDATE());

-- ============================================================================
-- CHANGE SUMMARY
-- ============================================================================
-- CHANGED: AuditId from INT to BIGINT IDENTITY
-- ADDED: ColumnName (track which column was modified - CRITICAL FIX)
-- ADDED: NOT NULL to critical fields (TableName, RecordId, ColumnName, Action, ChangedBy, ChangedOn)
-- ADDED: ValueDataType (for proper data interpretation)
-- ADDED: ChangedByUsername, IPAddress, SessionId, DeviceId, BrowserInfo, DatabaseUser (security context)
-- ADDED: TransactionId, BatchNumber, SequenceNumber (transaction context)
-- ADDED: FK constraint to ApplicationUser
-- ADDED: CHECK constraints for action validation and logical consistency
-- CHANGED: ChangedOn from DATETIME to DATETIME2(7)
-- ADDED: Comprehensive indexes for audit queries (history lookup, recent changes, by user, etc.)
-- ADDED: Filtered indexes for performance optimization
-- ============================================================================
