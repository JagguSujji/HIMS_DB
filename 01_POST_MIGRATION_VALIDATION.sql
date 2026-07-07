-- ============================================================================
-- HIMS DATABASE VALIDATION QUERIES - POST MIGRATION
-- ============================================================================
-- Run these after migration to verify everything is correct
-- ============================================================================

SET NOCOUNT ON;

PRINT ''
PRINT '╔════════════════════════════════════════════════════════════════════════╗';
PRINT '║         HIMS DATABASE POST-MIGRATION VALIDATION REPORT                ║';
PRINT '║                   ' + CONVERT(VARCHAR, GETDATE(), 121) + '                        ║';
PRINT '╚════════════════════════════════════════════════════════════════════════╝';
PRINT '';

-- ============================================================================
-- 1. VERIFY TABLE STRUCTURES
-- ============================================================================

PRINT '1. VERIFYING TABLE STRUCTURES';
PRINT '────────────────────────────────────────────────────────────────────────';

DECLARE @ExpectedTables TABLE (TableName NVARCHAR(128));
INSERT INTO @ExpectedTables VALUES 
    ('Patient'), ('ApplicationUser'), ('Employee'), ('Department'), 
    ('Appointment'), ('Admission'), ('Visit'), ('Encounter'),
    ('Bill'), ('Payment'), ('Prescription'), ('LabTest'),
    ('InvoiceHeader'), ('Bed'), ('AuditLog'), ('LoginAudit'),
    ('MedicationAdministration'), ('VitalSignsRecording'), ('EncounterDiagnosis'),
    ('Drug');

SELECT 
    CASE WHEN EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = et.TableName)
        THEN '✓ EXISTS'
        ELSE '✗ MISSING'
    END AS Status,
    et.TableName,
    (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = et.TableName) AS ColumnCount
FROM @ExpectedTables et
ORDER BY et.TableName;

PRINT '';

-- ============================================================================
-- 2. VERIFY DATA TYPES
-- ============================================================================

PRINT '2. VERIFYING CRITICAL DATA TYPES';
PRINT '────────────────────────────────────────────────────────────────────────';

SELECT 
    TABLE_NAME,
    COLUMN_NAME,
    DATA_TYPE,
    IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME IN ('Patient', 'Employee', 'Appointment', 'Bill', 'Prescription')
  AND COLUMN_NAME IN ('PatientId', 'EmployeeId', 'AppointmentId', 'BillId', 'PrescriptionId', 'CreatedOn', 'ModifiedOn')
ORDER BY TABLE_NAME, COLUMN_NAME;

-- Expected: BIGINT for IDs, DATETIME2(7) for dates

PRINT '';

-- ============================================================================
-- 3. VERIFY NOT NULL CONSTRAINTS
-- ============================================================================

PRINT '3. VERIFYING NOT NULL CONSTRAINTS ON CRITICAL FIELDS';
PRINT '────────────────────────────────────────────────────────────────────────';

SELECT 
    OBJECT_NAME(c.object_id) AS TableName,
    c.name AS ColumnName,
    CASE WHEN c.is_nullable = 0 THEN 'NOT NULL' ELSE 'NULLABLE' END AS NullableStatus
FROM sys.columns c
WHERE OBJECT_NAME(c.object_id) IN ('Patient', 'Employee', 'ApplicationUser', 'Appointment', 'Bill')
  AND c.name IN ('PatientId', 'EmployeeId', 'FirstName', 'LastName', 'Mobile', 'EmailAddress')
ORDER BY TableName, ColumnName;

PRINT '';

-- ============================================================================
-- 4. VERIFY FOREIGN KEY CONSTRAINTS
-- ============================================================================

PRINT '4. VERIFYING FOREIGN KEY CONSTRAINTS';
PRINT '────────────────────────────────────────────────────────────────────────';

SELECT 
    OBJECT_NAME(fk.parent_object_id) AS ChildTable,
    COL_NAME(fkc.parent_object_id, fkc.parent_column_id) AS ChildColumn,
    OBJECT_NAME(fk.referenced_object_id) AS ParentTable,
    COL_NAME(fkc.referenced_object_id, fkc.referenced_column_id) AS ParentColumn,
    fk.name AS ForeignKeyName
FROM sys.foreign_keys fk
INNER JOIN sys.foreign_key_columns fkc ON fk.object_id = fkc.constraint_object_id
WHERE OBJECT_NAME(fk.parent_object_id) IN ('Patient', 'Appointment', 'Admission', 'Bill', 'Prescription')
ORDER BY ChildTable, ChildColumn;

PRINT 'Expected: All critical FKs should exist';
PRINT '';

-- ============================================================================
-- 5. VERIFY INDEXES
-- ============================================================================

PRINT '5. VERIFYING INDEXES CREATED';
PRINT '────────────────────────────────────────────────────────────────────────';

SELECT 
    OBJECT_NAME(i.object_id) AS TableName,
    i.name AS IndexName,
    i.type_desc AS IndexType,
    COUNT(ic.column_id) AS ColumnCount
FROM sys.indexes i
LEFT JOIN sys.index_columns ic ON i.object_id = ic.object_id AND i.index_id = ic.index_id
WHERE OBJECT_NAME(i.object_id) IN ('Patient', 'Appointment', 'Admission', 'Bill', 'Payment')
  AND i.name IS NOT NULL
  AND i.type > 0  -- Exclude heaps
GROUP BY i.object_id, i.name, i.type_desc
ORDER BY TableName, IndexName;

PRINT 'Expected: Multiple indexes per table for performance';
PRINT '';

-- ============================================================================
-- 6. VERIFY AUDIT COLUMNS
-- ============================================================================

PRINT '6. VERIFYING AUDIT COLUMNS ADDED';
PRINT '────────────────────────────────────────────────────────────────────────';

SELECT 
    TABLE_NAME,
    CASE WHEN EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = t.TABLE_NAME AND COLUMN_NAME = 'CreatedBy') THEN '✓' ELSE '✗' END AS HasCreatedBy,
    CASE WHEN EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = t.TABLE_NAME AND COLUMN_NAME = 'CreatedOn') THEN '✓' ELSE '✗' END AS HasCreatedOn,
    CASE WHEN EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = t.TABLE_NAME AND COLUMN_NAME = 'ModifiedBy') THEN '✓' ELSE '✗' END AS HasModifiedBy,
    CASE WHEN EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = t.TABLE_NAME AND COLUMN_NAME = 'ModifiedOn') THEN '✓' ELSE '✗' END AS HasModifiedOn,
    CASE WHEN EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = t.TABLE_NAME AND COLUMN_NAME = 'IsDeleted') THEN '✓' ELSE '✗' END AS HasIsDeleted,
    CASE WHEN EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = t.TABLE_NAME AND COLUMN_NAME = 'RowVersion') THEN '✓' ELSE '✗' END AS HasRowVersion
FROM INFORMATION_SCHEMA.TABLES t
WHERE TABLE_NAME IN ('Patient', 'Employee', 'Appointment', 'Admission', 'Bill', 'Prescription', 'Visit', 'Encounter')
ORDER BY TABLE_NAME;

PRINT 'Expected: All columns should show ✓';
PRINT '';

-- ============================================================================
-- 7. VERIFY RECORD COUNTS
-- ============================================================================

PRINT '7. RECORD COUNTS BY TABLE';
PRINT '────────────────────────────────────────────────────────────────────────';

SELECT 
    'Patient' AS TableName, COUNT(*) AS RecordCount FROM Patient
UNION ALL
SELECT 'Employee', COUNT(*) FROM Employee
UNION ALL
SELECT 'ApplicationUser', COUNT(*) FROM ApplicationUser
UNION ALL
SELECT 'Appointment', COUNT(*) FROM Appointment
UNION ALL
SELECT 'Admission', COUNT(*) FROM Admission
UNION ALL
SELECT 'Visit', COUNT(*) FROM Visit
UNION ALL
SELECT 'Encounter', COUNT(*) FROM Encounter
UNION ALL
SELECT 'Bill', COUNT(*) FROM Bill
UNION ALL
SELECT 'Payment', COUNT(*) FROM Payment
UNION ALL
SELECT 'Prescription', COUNT(*) FROM Prescription
UNION ALL
SELECT 'LabTest', COUNT(*) FROM LabTest
UNION ALL
SELECT 'InvoiceHeader', COUNT(*) FROM InvoiceHeader
UNION ALL
SELECT 'AuditLog', COUNT(*) FROM AuditLog
UNION ALL
SELECT 'LoginAudit', COUNT(*) FROM LoginAudit
ORDER BY TableName;

PRINT 'Compare these counts with pre-migration values';
PRINT '';

-- ============================================================================
-- 8. VERIFY DATABASE INTEGRITY
-- ============================================================================

PRINT '8. DATABASE INTEGRITY CHECK';
PRINT '────────────────────────────────────────────────────────────────────────';

DBCC CHECKDB (HIMS_DB);

PRINT '';

-- ============================================================================
-- 9. VERIFY CONSTRAINTS
-- ============================================================================

PRINT '9. VERIFYING CHECK CONSTRAINTS';
PRINT '────────────────────────────────────────────────────────────────────────';

SELECT 
    OBJECT_NAME(parent_object_id) AS TableName,
    name AS ConstraintName,
    definition AS ConstraintDefinition
FROM sys.check_constraints
WHERE OBJECT_NAME(parent_object_id) IN ('Patient', 'Appointment', 'Bill', 'Prescription')
ORDER BY TableName, name;

PRINT '';

-- ============================================================================
-- 10. PERFORMANCE BASELINE
-- ============================================================================

PRINT '10. QUERY PERFORMANCE BASELINE';
PRINT '────────────────────────────────────────────────────────────────────────';

-- Test key queries
DECLARE @StartTime DATETIME2 = GETDATE();

SELECT COUNT(*) FROM Patient WHERE IsDeleted = 0;
SELECT COUNT(*) FROM Appointment WHERE AppointmentDate >= CAST(GETDATE() AS DATE);
SELECT COUNT(*) FROM Admission WHERE DischargeDate IS NULL;
SELECT COUNT(*) FROM Bill WHERE BalanceAmount > 0;

PRINT 'Execution Time: ' + CAST(DATEDIFF(MS, @StartTime, GETDATE()) AS VARCHAR) + ' ms';
PRINT '';

-- ============================================================================
-- FINAL SUMMARY
-- ============================================================================

PRINT '╔════════════════════════════════════════════════════════════════════════╗';
PRINT '║                      VALIDATION COMPLETE                              ║';
PRINT '║                                                                       ║';
PRINT '║  Review all sections above for any ✗ marks or errors                  ║';
PRINT '║  Compare record counts with pre-migration values                      ║';
PRINT '║  If all checks pass, migration was successful!                        ║';
PRINT '║                                                                       ║';
PRINT '╚════════════════════════════════════════════════════════════════════════╝';
PRINT '';

SET NOCOUNT OFF;
