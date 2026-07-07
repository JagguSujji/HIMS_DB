CREATE     PROCEDURE [dbo].[USP_Prescription_Items_Get]


(
 @PrescriptionId BIGINT

)

AS
BEGIN


SELECT


PI.PrescriptionItemId,

D.DrugName,

PI.Dosage


FROM dbo.PrescriptionItem PI


INNER JOIN dbo.Drug D

ON PI.DrugId=D.DrugId



WHERE


PI.PrescriptionId=@PrescriptionId;



END
