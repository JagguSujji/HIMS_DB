


/*******************************************************
 19. Controlled Drug Register
*******************************************************/
CREATE     PROCEDURE [dbo].[USP_ControlledDrug_Register]
(
 @DrugId INT,
 @PatientId INT,
 @DoctorId INT,
 @Quantity INT,
 @AdministeredBy INT
)
AS
BEGIN


INSERT INTO dbo.ControlledDrugRegister
(
 DrugId,
 PatientId,
 DoctorId,
 Quantity,
 DispensedOn,
 WitnessedBy
)
VALUES
(
 @DrugId,
 @PatientId,
 @DoctorId,
 @Quantity,
 GETDATE(),
 @AdministeredBy
);


END
