CREATE     PROCEDURE [dbo].[USP_PrescriptionItem_Save]

(
 @PrescriptionId BIGINT,
 @DrugId BIGINT,
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
