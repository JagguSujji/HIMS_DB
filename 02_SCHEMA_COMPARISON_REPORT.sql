-- ============================================================================
-- HIMS DATABASE SCHEMA COMPARISON SCRIPT
-- ============================================================================
-- Compare old vs new schema to identify changes
-- ============================================================================

SET NOCOUNT ON;

PRINT '';
PRINT '╔════════════════════════════════════════════════════════════════════════╗';
PRINT '║              SCHEMA CHANGE SUMMARY & IMPACT ANALYSIS                  ║';
PRINT '╚════════════════════════════════════════════════════════════════════════╝';
PRINT '';

-- ============================================================================
-- COLUMN TYPE CHANGES
-- ============================================================================

PRINT 'CRITICAL CHANGES - ID COLUMNS (INT → BIGINT)';
PRINT '────────────────────────────────────────────────────────────────────────';
PRINT 'These changes require application code updates:';
PRINT '';
PRINT 'Patient.PatientId: INT → BIGINT';
PRINT 'Employee.EmployeeId: INT → BIGINT (already was)';
PRINT 'Appointment.AppointmentId: INT → BIGINT';
PRINT 'Admission.AdmissionId: INT → BIGINT';
PRINT 'Bill.BillId: INT → BIGINT';
PRINT 'Prescription.PrescriptionId: INT → BIGINT';
PRINT 'Visit.VisitId: INT → BIGINT';
PRINT 'Encounter.EncounterId: INT → BIGINT';
PRINT 'Payment.PaymentId: INT → BIGINT';
PRINT 'InvoiceHeader.InvoiceId: INT → BIGINT';
PRINT '';

PRINT 'DATETIME CHANGES (DATETIME → DATETIME2(7))';
PRINT '────────────────────────────────────────────────────────────────────────';
PRINT 'These provide microsecond precision (vs 3-digit milliseconds)';
PRINT 'Backwards compatible with applications';
PRINT '';
PRINT 'Affected date columns in all transaction tables:';
PRINT '  - CreatedOn, ModifiedOn (new fields)';
PRINT '  - All event/transaction date fields';
PRINT '';

PRINT 'TEXT → NVARCHAR(MAX) CHANGES';
PRINT '────────────────────────────────────────────────────────────────────────';
PRINT 'More efficient storage and querying:';
PRINT '  - Patient.Address: TEXT → NVARCHAR(MAX)';
PRINT '  - Prescription.* notes fields: Similar conversions';
PRINT '';

-- ============================================================================
-- NEW COLUMNS ADDED
-- ============================================================================

PRINT 'NEW COLUMNS ADDED TO EXISTING TABLES';
PRINT '────────────────────────────────────────────────────────────────────────';
PRINT '';

PRINT 'Patient Table: 20+ new fields';
PRINT '  - EmergencyContactPhone, EmergencyContactAddress (safety)';
PRINT '  - GuardianName, GuardianPhone (minors support)';
PRINT '  - AadhaarNumber, PANNumber, etc. (identification)';
PRINT '  - BloodDonor, OrganDonor, AllergyInformation (health tracking)';
PRINT '  - InsuranceFields (insurance tracking)';
PRINT '  - CreatedBy, CreatedOn, ModifiedBy, ModifiedOn, IsDeleted, RowVersion (audit)';
PRINT '';

PRINT 'Employee Table: Enhanced with';
PRINT '  - Medical fields: RegistrationNumber, SpecializationId, QualificationId, LicenseNumber';
PRINT '  - Employment fields: DepartmentId, BranchId';
PRINT '  - Bank fields: BankAccountNumber, BankIFSCCode, BankName';
PRINT '  - Audit fields: CreatedBy, CreatedOn, ModifiedBy, ModifiedOn, IsDeleted, RowVersion';
PRINT '';

PRINT 'ApplicationUser Table: Enhanced with';
PRINT '  - Security fields: PasswordExpiresOn, MustChangePassword, PasswordPolicyId';
PRINT '  - Verification: IsEmailVerified, EmailVerifiedOn, IsMobileVerified, MobileVerifiedOn';
PRINT '  - Login tracking: FailedLoginAttemptAt, LockedReason, LastLoginIpAddress';
PRINT '  - CreatedBy, CreatedOn, ModifiedBy, ModifiedOn, IsSystemAccount';
PRINT '';

PRINT 'Appointment Table: Enhanced with';
PRINT '  - Confirmation tracking: ConfirmedBy, ConfirmedOn, CancelledBy, CancelledOn, CancellationReason';
PRINT '  - Check-in/out: CheckInTime, CheckOutTime';
PRINT '  - Rescheduling: Rescheduled, RescheduledFromId, NoShowReason';
PRINT '  - Audit fields: CreatedBy, CreatedOn, ModifiedBy, ModifiedOn, IsDeleted, RowVersion';
PRINT '';

PRINT 'Similar enhancements to: Admission, Bill, Prescription, Visit, Encounter, Payment';
PRINT '';

-- ============================================================================
-- NEW TABLES
-- ============================================================================

PRINT 'NEW TABLES ADDED';
PRINT '────────────────────────────────────────────────────────────────────────';
PRINT '';
PRINT '1. MedicationAdministration - Track when/how medications given to patients';
PRINT '   Fields: PrescriptionId, PatientId, DrugId, AdministeredBy, VerifiedBy';
PRINT '   Fields: DoseGiven, RouteOfAdministration, AdministrationDateTime';
PRINT '   Fields: AdministrationStatus, AdverseReactionObserved, etc.';
PRINT '';

PRINT '2. VitalSignsRecording - Record vital signs at each encounter';
PRINT '   Fields: PatientId, EncounterId, RecordedBy';
PRINT '   Fields: BP, HR, RR, SpO2, Temperature, BloodGlucose, Weight, Height, BMI';
PRINT '   Fields: PainScore, GlasgowComaScale, CriticalValues';
PRINT '';

PRINT '3. EncounterDiagnosis - Enhanced diagnosis tracking per encounter';
PRINT '   Fields: EncounterId, PatientId, DiagnosisCode, ICD-10 coding';
PRINT '   Fields: Primary vs Secondary diagnosis, Status tracking';
PRINT '   Fields: Onset date, Resolution date, Severity level';
PRINT '   Fields: Investigation methods, Treatment outcome, Referrals';
PRINT '';

-- ============================================================================
-- APPLICATION IMPACT
-- ============================================================================

PRINT 'APPLICATION CODE CHANGES REQUIRED';
PRINT '════════════════════════════════════════════════════════════════════════';
PRINT '';

PRINT '1. DATA ACCESS LAYER (DAL) / ORM Mapping';
PRINT '   - Update Entity models to use BIGINT for IDs';
PRINT '   - Update stored procedures with new parameter types';
PRINT '   - Test BIGINT max value handling (9,223,372,036,854,775,807)';
PRINT '';

PRINT '2. API & Service Layer';
PRINT '   - Update API contracts to use int64/long for IDs';
PRINT '   - Verify JSON serialization of BIGINT values';
PRINT '   - Test null-safety for new nullable columns';
PRINT '';

PRINT '3. Frontend/UI';
PRINT '   - Verify ID fields are using int64 capable types';
PRINT '   - Test display of BIGINT values';
PRINT '   - Update any hardcoded int assumptions';
PRINT '';

PRINT '4. Reports/Analytics';
PRINT '   - Update SSRS reports for new columns (audit fields)';
PRINT '   - Verify date fields still format correctly with DATETIME2(7)';
PRINT '   - Test new clinical tables for reporting';
PRINT '';

PRINT '5. Batch Jobs/ETL';
PRINT '   - Update SSIS packages for new table structures';
PRINT '   - Test data type conversions';
PRINT '   - Verify integration with external systems';
PRINT '';

PRINT '6. Search/Indexing';
PRINT '   - Rebuild full-text indexes if used';
PRINT '   - Test search performance with new indexes';
PRINT '   - Verify search algorithms work with BIGINT IDs';
PRINT '';

-- ============================================================================
-- BACKWARDS COMPATIBILITY
-- ============================================================================

PRINT 'BACKWARDS COMPATIBILITY CHECKLIST';
PRINT '════════════════════════════════════════════════════════════════════════';
PRINT '';
PRINT '✓ Existing data will be preserved (no data loss)';
PRINT '✓ DATETIME → DATETIME2(7) is backwards compatible';
PRINT '✓ TEXT → NVARCHAR(MAX) is backwards compatible';
PRINT '✓ New columns have default values (won't break INSERT)';
PRINT '✓ Old stored procedures may need updates';
PRINT '✗ BIGINT IDs require application code changes';
PRINT '✗ New foreign keys may cause validation errors';
PRINT '✗ New NOT NULL constraints may block INSERT';
PRINT '';

-- ============================================================================
-- TESTING CHECKLIST
-- ============================================================================

PRINT 'REQUIRED TESTING BEFORE PRODUCTION';
PRINT '════════════════════════════════════════════════════════════════════════';
PRINT '';
PRINT 'Unit Tests';
PRINT '  □ Test BIGINT ID handling in all data access layers';
PRINT '  □ Test new audit columns (CreatedBy, ModifiedBy, etc.)';
PRINT '  □ Test new clinical tables';
PRINT '  □ Test soft delete functionality (IsDeleted flag)';
PRINT '';
PRINT 'Integration Tests';
PRINT '  □ Test appointment booking flow';
PRINT '  □ Test admission workflow';
PRINT '  □ Test billing and payment flow';
PRINT '  □ Test prescription and medication administration';
PRINT '  □ Test vital signs recording';
PRINT '';
PRINT 'Performance Tests';
PRINT '  □ Test query performance with new indexes';
PRINT '  □ Load test with peak user load';
PRINT '  □ Verify index usage';
PRINT '  □ Monitor transaction log growth';
PRINT '';
PRINT 'Data Quality Tests';
PRINT '  □ Verify record counts match pre-migration';
PRINT '  □ Validate foreign key relationships';
PRINT '  □ Check for orphaned records';
PRINT '  □ Verify data integrity with DBCC CHECKDB';
PRINT '';
PRINT 'User Acceptance Tests';
PRINT '  □ Smoke tests for critical workflows';
PRINT '  □ Business process validations';
PRINT '  □ Report generation';
PRINT '  □ Export/import functionality';
PRINT '';

PRINT '════════════════════════════════════════════════════════════════════════';
PRINT 'End of Schema Comparison Report';
PRINT '════════════════════════════════════════════════════════════════════════';

SET NOCOUNT OFF;
