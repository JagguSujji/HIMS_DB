


/*******************************************************
 8. Create Prescription
*******************************************************/
CREATE     PROCEDURE [dbo].[USP_Prescription_Create]
(
    @ConsultationId INT,
    @EncounterId INT,
    @PatientId INT,
    @PrescribedBy INT,
    @PrescriptionType VARCHAR(50)
)
AS
BEGIN


INSERT INTO dbo.Prescription
(
 ConsultationId,
 PrescriptionDate,
 EncounterId,
 PrescribedBy,
 Status,
 PrescriptionType,
 IsActive,
 PatientId
)
VALUES
(
 @ConsultationId,
 GETDATE(),
 @EncounterId,
 @PrescribedBy,
 'CREATED',
 @PrescriptionType,
 1,
 @PatientId
);


SELECT SCOPE_IDENTITY() PrescriptionId;

END
