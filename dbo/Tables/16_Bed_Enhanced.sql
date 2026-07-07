-- ============================================================================
-- HIMS Bed Table - ALREADY WELL DESIGNED
-- Minor enhancements for completeness
-- ============================================================================
-- The Bed table already had good FK constraints and indexes
-- Adding audit enhancements for consistency
-- ============================================================================

CREATE TABLE [dbo].[Bed] (
    -- PRIMARY KEY
    [BedId]                     INT             IDENTITY (1, 1) NOT NULL,
    
    -- FOREIGN KEYS
    [RoomId]                    INT             NOT NULL,
    [BedTypeId]                 INT             NULL,
    [BedStatusId]               INT             NOT NULL,
    [FloorId]                   BIGINT          NULL,
    
    -- BED INFORMATION
    [BedCode]                   VARCHAR (20)    NOT NULL,
    [BedNumber]                 VARCHAR (20)    NOT NULL,
    [Description]               NVARCHAR (500)  NULL,                       -- NEW - Bed details
    [BedCapacity]               INT             NOT NULL DEFAULT 1,         -- NEW - Number of patients
    
    -- MAINTENANCE
    [LastCleanedOn]             DATETIME2(7)    NULL,                       -- Changed from DATETIME
    [NextMaintenanceDate]       DATE            NULL,                       -- NEW - Maintenance schedule
    [LastMaintenanceDate]       DATE            NULL,                       -- NEW - Last maintenance
    [MaintenanceNotes]          NVARCHAR (MAX)  NULL,                       -- NEW - Maintenance history
    
    -- OCCUPANCY
    [IsOccupied]                BIT             NOT NULL DEFAULT 0,
    [IsActive]                  BIT             NOT NULL DEFAULT 1,
    [IsDeleted]                 BIT             NOT NULL DEFAULT 0,         -- NEW - Soft delete
    [IsTemporarilyClosed]       BIT             NOT NULL DEFAULT 0,         -- NEW - Closed for maintenance
    [ClosedFrom]                DATE            NULL,                       -- NEW - Closure dates
    [ClosedUntil]               DATE            NULL,                       -- NEW - Closure dates
    
    -- STATUS TRACKING
    [OccupiedFrom]              DATETIME2(7)    NULL,                       -- NEW - When bed was occupied
    [AvailableFrom]             DATETIME2(7)    NULL,                       -- NEW - When bed becomes available
    
    -- AUDIT
    [CreatedBy]                 BIGINT          NOT NULL,                   -- NEW - Audit
    [CreatedOn]                 DATETIME2(7)    NOT NULL DEFAULT GETDATE(), -- NEW - Audit
    [ModifiedBy]                BIGINT          NULL,                       -- NEW - Audit
    [ModifiedOn]                DATETIME2(7)    NULL,                       -- NEW - Audit
    [RowVersion]                ROWVERSION      NOT NULL,
    [Remarks]                   NVARCHAR (500)  NULL,
    
    -- CONSTRAINTS
    PRIMARY KEY CLUSTERED ([BedId] ASC),
    
    CONSTRAINT [FK_Bed_Room]
        FOREIGN KEY ([RoomId]) REFERENCES [dbo].[Room] ([RoomId]),
    CONSTRAINT [FK_Bed_BedType]
        FOREIGN KEY ([BedTypeId]) REFERENCES [dbo].[BedType] ([BedTypeId]),
    CONSTRAINT [FK_Bed_BedStatus]
        FOREIGN KEY ([BedStatusId]) REFERENCES [dbo].[BedStatus] ([BedStatusId]),
    CONSTRAINT [FK_Bed_Floor]
        FOREIGN KEY ([FloorId]) REFERENCES [dbo].[Floor] ([FloorId]),
    CONSTRAINT [FK_Bed_CreatedBy]
        FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[ApplicationUser] ([UserId]),
    CONSTRAINT [FK_Bed_ModifiedBy]
        FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[ApplicationUser] ([UserId]),
    
    -- CHECK CONSTRAINTS
    CONSTRAINT [CK_Bed_BedCapacity]
        CHECK ([BedCapacity] > 0),
    CONSTRAINT [CK_Bed_MaintenanceDates]
        CHECK ([LastMaintenanceDate] IS NULL OR [NextMaintenanceDate] IS NULL OR [LastMaintenanceDate] <= [NextMaintenanceDate]),
    CONSTRAINT [CK_Bed_ClosureDates]
        CHECK ([ClosedFrom] IS NULL OR [ClosedUntil] IS NULL OR [ClosedFrom] <= [ClosedUntil]),
    CONSTRAINT [CK_Bed_OccupancyDates]
        CHECK ([OccupiedFrom] IS NULL OR [AvailableFrom] IS NULL OR [OccupiedFrom] <= [AvailableFrom])
);

-- CREATE INDEXES
CREATE NONCLUSTERED INDEX [IX_Bed_RoomId] ON [dbo].[Bed]([RoomId]);
CREATE NONCLUSTERED INDEX [IX_Bed_BedStatusId] ON [dbo].[Bed]([BedStatusId]);
CREATE NONCLUSTERED INDEX [IX_Bed_BedTypeId] ON [dbo].[Bed]([BedTypeId]);
CREATE NONCLUSTERED INDEX [IX_Bed_FloorId] ON [dbo].[Bed]([FloorId]);

-- Filtered indexes
CREATE NONCLUSTERED INDEX [IX_Bed_Available]
    ON [dbo].[Bed]([RoomId], [BedStatusId])
    WHERE [IsDeleted] = 0 AND [IsActive] = 1 AND [IsOccupied] = 0 AND [IsTemporarilyClosed] = 0;

CREATE UNIQUE NONCLUSTERED INDEX [IX_Bed_Code]
    ON [dbo].[Bed]([RoomId] ASC, [BedCode] ASC);

-- ============================================================================
-- CHANGE SUMMARY
-- ============================================================================
-- ADDED: Description, BedCapacity
-- CHANGED: LastCleanedOn from DATETIME to DATETIME2(7)
-- ADDED: NextMaintenanceDate, LastMaintenanceDate, MaintenanceNotes
-- ADDED: IsDeleted, IsTemporarilyClosed, ClosedFrom, ClosedUntil
-- ADDED: OccupiedFrom, AvailableFrom (occupancy tracking)
-- ADDED: CreatedBy, CreatedOn, ModifiedBy, ModifiedOn (audit)
-- ADDED: FK constraints for CreatedBy, ModifiedBy
-- ADDED: CHECK constraints for date validations
-- ADDED: Filtered index for available beds
-- ============================================================================
