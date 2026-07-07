# HIMS Database Refactoring Guide
## Enterprise-Ready Transformation

### Scope
This refactoring addresses critical data integrity, security, and performance issues to achieve enterprise-grade quality.

### Execution Plan

#### PHASE 1: Type Standardization & Core Fixes
- Standardize all identity columns to BIGINT
- Fix data type mismatches
- Replace TEXT with NVARCHAR(MAX)
- Standardize DATETIME to DATETIME2(7)
- Fix decimal precision to DECIMAL(18,2)

#### PHASE 2: Constraint Implementation
- Add all missing foreign keys
- Add NOT NULL constraints to required fields
- Add CHECK constraints for domain validation
- Add UNIQUE constraints where needed
- Fix calculated column PERSISTED flags

#### PHASE 3: Audit & Security
- Add audit columns to all transaction tables
- Fix AuditLog table structure
- Add encryption for sensitive columns
- Implement soft delete pattern

#### PHASE 4: Performance & Indexes
- Create comprehensive index strategy
- Add FK column indexes
- Add search/filter column indexes
- Add date range indexes
- Create filtered indexes for soft-deleted data

#### PHASE 5: Clinical Workflow Enhancements
- Add missing clinical tables
- Create medication administration workflow
- Enhance encounter-diagnosis relationships
- Add vital signs integration

### Migration Strategy

1. **Backup existing data**
   ```sql
   BACKUP DATABASE [HIMS_DB] TO DISK = 'C:\Backups\HIMS_DB_PreRefactor.bak';
   ```

2. **Apply changes in development first**
   - Test all scripts
   - Validate data integrity
   - Performance test queries

3. **Stage-by-stage production deployment**
   - Deploy within maintenance window
   - Verify indexes and constraints
   - Monitor query performance

4. **Rollback procedure** (if needed)
   - Keep transaction logs
   - Document pre-refactor state
   - Have rollback scripts ready

### Files Included

**Core Table Fixes:**
- 01_Patient_Refactored.sql
- 02_ApplicationUser_Refactored.sql
- 03_Employee_Refactored.sql
- 04_Department_Refactored.sql
- 05_Appointment_Refactored.sql
- 06_Admission_Refactored.sql
- 07_Visit_Refactored.sql
- 08_Encounter_Refactored.sql
- 09_Bill_Refactored.sql
- 10_Payment_Refactored.sql
- 11_Prescription_Refactored.sql
- 12_LabTest_Refactored.sql

**Support Tables:**
- 13_InvoiceHeader_Refactored.sql
- 14_Bed_Refactored.sql
- 15_AuditLog_Refactored.sql
- 16_LoginAudit_Refactored.sql

**New Clinical Tables:**
- 17_MedicationAdministration_New.sql
- 18_VitalSignsRecording_New.sql
- 19_ClinicalNoteEnhanced_New.sql
- 20_EncounterDiagnosisEnhanced_New.sql

**Indexes & Constraints:**
- 30_Create_Indexes.sql
- 31_Add_Constraints.sql
- 32_Add_CheckConstraints.sql
- 33_Fix_ForeignKeys.sql

**Migration & Validation:**
- 40_Data_Migration_Strategy.sql
- 41_Validation_Queries.sql
- 42_Performance_Baseline.sql

### Validation Checklist

- [ ] All tables created successfully
- [ ] All foreign keys created
- [ ] All indexes created
- [ ] All constraints validated
- [ ] Data validation queries pass
- [ ] Performance baseline acceptable
- [ ] Audit trail complete
- [ ] Backup verified

### Rollback Procedure

If issues occur:
1. Restore from backup
2. Review error logs
3. Fix and test in dev
4. Retry deployment

### Support & Questions

Refer to specific refactored table file comments for detailed explanations.
