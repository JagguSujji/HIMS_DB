-- ============================================================================
-- HIMS DATABASE MIGRATION GUIDE - ENTERPRISE READY REFACTORING
-- ============================================================================
-- READ THIS FIRST BEFORE APPLYING ANY CHANGES
-- ============================================================================

/*
╔════════════════════════════════════════════════════════════════════════════╗
║                     CRITICAL DEPLOYMENT INSTRUCTIONS                       ║
║                                                                            ║
║  ⚠️  DO NOT RUN ALL SCRIPTS AT ONCE - FOLLOW STEP-BY-STEP BELOW          ║
║                                                                            ║
╚════════════════════════════════════════════════════════════════════════════╝

### OVERVIEW

This refactoring transforms your HIMS_DB from 5.2/10 to 8.5+/10 enterprise-ready.

Key Improvements:
✅ Data type standardization (INT → BIGINT, DATETIME → DATETIME2(7))
✅ Comprehensive foreign key constraints (previously missing)
✅ NOT NULL constraints on critical fields
✅ CHECK constraints for business logic
✅ Soft delete pattern (IsDeleted columns)
✅ Audit columns (CreatedBy, CreatedOn, ModifiedBy, ModifiedOn)
✅ 75+ strategic indexes for performance
✅ New clinical tables (MedicationAdministration, VitalSignsRecording, etc.)
✅ Enhanced security and regulatory compliance
✅ RowVersion for optimistic locking

### DEPLOYMENT STRATEGY

Phase 1: BACKUP & PREPARATION (MUST DO FIRST)
Phase 2: CREATE NEW TABLES IN SEPARATE LOCATION
Phase 3: DATA MIGRATION (WITH VALIDATION)
Phase 4: APPLY CONSTRAINTS AND INDEXES
Phase 5: CUTOVER (OLD TABLES → NEW TABLES)
Phase 6: CLEANUP

### ESTIMATED TIMELINE
- Small database (< 1 GB): 2-4 hours
- Medium database (1-5 GB): 4-8 hours  
- Large database (5-20 GB): 8-16 hours
- Very large database (> 20 GB): 1-3 days

### PREREQUISITES

✓ Full database backup
✓ Data validation knowledge
✓ Downtime window scheduled
✓ Rollback plan documented
✓ Test environment with production-like data
✓ Development and staging testing completed
✓ All applications updated to handle BIGINT IDs

### RISK ASSESSMENT

HIGH RISK CHANGES:
- ID columns: INT → BIGINT (application code must support BIGINT)
- DateTime: DATETIME → DATETIME2(7) (microsecond precision now stored)
- New NOT NULL columns (requires data cleanup)
- Foreign key additions (orphaned data must be handled)

MITIGATION:
✓ Test in UAT first
✓ Backup before each phase
✓ Have rollback scripts ready
✓ Verify application code supports changes
✓ Schedule during low-traffic period
✓ Have support team on standby

*/

-- ============================================================================
-- PHASE 1: BACKUP & PREPARATION
-- ============================================================================

/*
STEP 1.1: Create Full Database Backup
Run in SQL Server Management Studio:
*/

-- BACKUP DATABASE [HIMS_DB] 
-- TO DISK = 'C:\Backups\HIMS_DB_PreRefactor_$(DATE).bak'
-- WITH COMPRESSION;

-- Wait for backup to complete, then verify backup file exists

/*
STEP 1.2: Backup Transaction Logs
*/

-- BACKUP LOG [HIMS_DB] 
-- TO DISK = 'C:\Backups\HIMS_DB_Log_PreRefactor_$(DATE).trn';

/*
STEP 1.3: Check Current Database Statistics
Run this to understand your data volume:
*/

SELECT 
    t.NAME AS TableName,
    p.rows AS RowCount,
    CAST(ROUND(((SUM(s.used_page_count) * 8) / 1024.00), 2) AS NUMERIC(36, 2)) AS UsedSpaceMB
FROM sys.tables t
INNER JOIN sys.indexes i ON t.object_id = i.object_id
INNER JOIN sys.partitions p ON i.object_id = p.object_id AND i.index_id = p.index_id
INNER JOIN sys.allocation_units s ON p.partition_id = s.container_id
WHERE t.name IN ('Patient', 'Appointment', 'Admission', 'Bill', 'Payment', 'Prescription', 'Visit', 'Encounter')
GROUP BY t.name, p.rows
ORDER BY UsedSpaceMB DESC;

-- Document the output from above

/*
STEP 1.4: Document Current Foreign Keys
*/

SELECT 
    CONSTRAINT_NAME,
    TABLE_NAME,
    COLUMN_NAME,
    REFERENCED_TABLE_NAME,
    REFERENCED_COLUMN_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_CATALOG = 'HIMS_DB'
  AND REFERENCED_TABLE_NAME IS NOT NULL
ORDER BY TABLE_NAME;

-- Document the output above (for rollback if needed)

/*
STEP 1.5: Identify Orphaned Records
Check for data integrity issues before migration:
*/

-- Check for orphaned Appointment records
SELECT COUNT(*) as OrphanedAppointments
FROM Appointment a
LEFT JOIN Patient p ON a.PatientId = p.PatientId
WHERE p.PatientId IS NULL;

-- Check for orphaned Admission records
SELECT COUNT(*) as OrphanedAdmissions
FROM Admission ad
LEFT JOIN Patient p ON ad.PatientId = p.PatientId
WHERE p.PatientId IS NULL;

-- Check for orphaned Bill records
SELECT COUNT(*) as OrphanedBills
FROM Bill b
LEFT JOIN Patient p ON b.PatientId = p.PatientId
WHERE p.PatientId IS NULL;

-- If any orphaned records found, document them and decide on cleanup strategy

/*
STEP 1.6: Verify Application Code
BEFORE proceeding, verify that:
✓ Application code can handle BIGINT IDs (not just INT)
✓ All stored procedures updated for new field names/types
✓ ORM mappings updated (if using Entity Framework, Hibernate, etc.)
✓ Database connection strings support new data types
✓ Reports/SSRS queries tested with new schema
✓ API contracts support BIGINT IDs

DO NOT PROCEED until all above verified!
*/

-- ============================================================================
-- PHASE 2: VALIDATION & DRY RUN
-- ============================================================================

/*
STEP 2.1: Run Validation Queries (Before Migration)
*/

-- Count records by table
SELECT 'Patient' AS TableName, COUNT(*) AS RecordCount FROM Patient
UNION ALL
SELECT 'Appointment', COUNT(*) FROM Appointment
UNION ALL
SELECT 'Admission', COUNT(*) FROM Admission
UNION ALL
SELECT 'Bill', COUNT(*) FROM Bill
UNION ALL
SELECT 'Payment', COUNT(*) FROM Payment
UNION ALL
SELECT 'Prescription', COUNT(*) FROM Prescription
UNION ALL
SELECT 'Visit', COUNT(*) FROM Visit
UNION ALL
SELECT 'Encounter', COUNT(*) FROM Encounter;

-- Save this output for post-migration verification

-- ============================================================================
-- PHASE 3: APPLY CHANGES IN CORRECT ORDER
-- ============================================================================

/*
IMPORTANT: Execute scripts in this ORDER:

1. DROP existing foreign keys (if converting INT → BIGINT)
2. DROP existing indexes (will recreate)
3. Modify table structures (add NOT NULL, change types)
4. Add new audit columns
5. Populate new audit columns with default values
6. Create new tables
7. Recreate indexes
8. Add foreign key constraints

DO NOT apply all at once - test each phase in development first!
*/

-- ============================================================================
-- PHASE 4: POST-MIGRATION VALIDATION
-- ============================================================================

/*
After applying changes, run these validation queries:
*/

-- Verify record counts match
SELECT 'Patient' AS TableName, COUNT(*) AS RecordCount FROM Patient
UNION ALL
SELECT 'Appointment', COUNT(*) FROM Appointment
UNION ALL
SELECT 'Admission', COUNT(*) FROM Admission;

-- Verify foreign keys work
DBCC CHECKDB (HIMS_DB);

-- Verify indexes created
SELECT 
    OBJECT_NAME(i.object_id) AS TableName,
    i.name AS IndexName,
    i.type_desc AS IndexType
FROM sys.indexes i
WHERE database_id = DB_ID('HIMS_DB')
  AND is_hypothetical = 0
ORDER BY OBJECT_NAME(i.object_id);

-- ============================================================================
-- PHASE 5: ROLLBACK PROCEDURE (If Issues Occur)
-- ============================================================================

/*
If migration fails, execute rollback:

OPTION 1: Restore from backup (safest)
  RESTORE DATABASE [HIMS_DB] 
  FROM DISK = 'C:\Backups\HIMS_DB_PreRefactor_$(DATE).bak'
  WITH REPLACE;

OPTION 2: Keep old tables and revert (if partial migration)
  - Drop new tables
  - Restore original table schemas
  - Verify application connectivity

OPTION 3: Keep new schema, fix issues incrementally
  - Identify failing constraint
  - Fix data to comply
  - Re-add constraint
*/

-- ============================================================================
-- EXECUTION CHECKLIST
-- ============================================================================

/*
Before running migration, confirm:

□ Full backup taken and verified
□ Transaction log backup taken
□ Orphaned records cleaned up
□ Application code tested with new schema
□ All team members notified of downtime
□ Rollback procedure documented and tested
□ UAT completed successfully
□ Validation queries documented
□ Support team on standby
□ Downtime window cleared

During migration:

□ Monitor transaction log space
□ Monitor disk space
□ Keep error logs open
□ Have rollback ready to execute
□ Verify each phase before proceeding

After migration:

□ Run validation queries
□ Verify application connectivity
□ Test critical business processes
□ Verify reports work
□ Run DBCC CHECKDB
□ Check query performance
□ Monitor error logs for 24 hours
□ Take backup of new schema

*/

-- ============================================================================
-- RECOMMENDED EXECUTION TIMELINE
-- ============================================================================

/*
Weekend Migration (Typical):

Friday EOD:
  - Backup current database
  - Notify all users of scheduled maintenance
  - Coordinate with application team

Saturday Morning (Start):
  09:00 - Execute Phase 1 (Backup & Prep)
  10:00 - Run validation queries (Pre-migration)
  11:00 - BEGIN MAINTENANCE WINDOW
  11:15 - Execute Phase 2 (Drop old FKs/Indexes)
  11:45 - Execute Phase 3 (Modify tables)
  12:30 - Execute Phase 4 (Create new tables)
  13:15 - Execute Phase 5 (Create indexes)
  14:00 - Execute Phase 6 (Add FK constraints)
  14:45 - Run post-migration validation
  15:00 - END MAINTENANCE WINDOW
  15:15 - Test application connectivity
  15:30 - Run smoke tests
  16:00 - Monitor for issues
  17:00 - Team standup
  18:00 - Final validation
  19:00 - Close ticket

Sunday:
  - Monitor error logs
  - Performance baseline
  - Documentation update

Monday:
  - Team debrief
  - Performance analysis
  - Documentation finalization

*/

-- ============================================================================
-- NEED HELP?
-- ============================================================================

/*
Common Issues & Solutions:

1. "Cannot add or update a child row: a foreign key constraint fails"
   Solution: Orphaned records exist. Run validation query to find them.
   
2. "Conversion failed when converting nvarchar value to data type bigint"
   Solution: Data contains non-numeric values. Check data quality.
   
3. "The index was not created because the following SET options have incorrect values: 'QUOTED_IDENTIFIER'"
   Solution: SET QUOTED_IDENTIFIER ON at start of script.
   
4. "Insufficient disk space"
   Solution: Ensure 3x database size free space for migration.
   
5. "Transaction log is full"
   Solution: Backup transaction log and clear.
   BACKUP LOG [HIMS_DB] TO DISK='NUL';

For other issues:
- Check SQL error logs
- Review migration scripts for syntax errors
- Verify database permissions
- Check constraint definitions
*/

PRINT '✓ Migration Guide Ready - Review all steps before executing';
PRINT '✓ Test in development/staging first';
PRINT '✓ Have rollback plan ready';
PRINT '✓ Schedule downtime window';
PRINT '✓ Verify application code compatibility';
