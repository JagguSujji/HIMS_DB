


/*******************************************************
 20. Medication Administration Record
*******************************************************/
CREATE     PROCEDURE [dbo].[USP_MedicationAdministration_Save]
(
 @PatientId INT,
 @DrugId INT,
 @Dose VARCHAR(100),
 @AdministeredBy INT
)
AS
BEGIN


INSERT INTO dbo.MedicationAdministrationRecord
(
 PatientId,
 DrugId,
 Dose,
 AdministeredBy,
 AdministeredOn
)
VALUES
(
 @PatientId,
 @DrugId,
 @Dose,
 @AdministeredBy,
 GETDATE()
);


END
