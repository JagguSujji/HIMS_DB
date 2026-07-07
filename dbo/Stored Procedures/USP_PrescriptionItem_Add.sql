


/*******************************************************
 9. Add Prescription Item
*******************************************************/
CREATE     PROCEDURE [dbo].[USP_PrescriptionItem_Add]
(
 @PrescriptionId INT,
 @DrugId INT,
 @Dosage VARCHAR(200)
)
AS
BEGIN


INSERT INTO dbo.PrescriptionItem
(
 PrescriptionId,
 DrugId,
 Dosage
)
VALUES
(
 @PrescriptionId,
 @DrugId,
 @Dosage
);

END
