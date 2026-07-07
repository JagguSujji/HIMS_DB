


/*******************************************************
 10. Get Patient Prescription
*******************************************************/
CREATE     PROCEDURE [dbo].[USP_Patient_Prescription_Get]
(
 @PatientId INT
)
AS
BEGIN


SELECT

P.PrescriptionId,
P.PrescriptionDate,
P.Status,
PI.DrugId,
D.DrugName,
PI.Dosage

FROM dbo.Prescription P

INNER JOIN dbo.PrescriptionItem PI
ON P.PrescriptionId=PI.PrescriptionId

INNER JOIN dbo.Drug D
ON PI.DrugId=D.DrugId

WHERE P.PatientId=@PatientId;


END
