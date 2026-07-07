


/*******************************************************
 12. Pharmacy Dispense Item
*******************************************************/
CREATE     PROCEDURE [dbo].[USP_PharmacyDispenseItem_Create]
(
 @DispenseId INT,
 @DrugId INT,
 @Quantity INT,
 @Dose VARCHAR(100)
)
AS
BEGIN


INSERT INTO dbo.PrescriptionDispenseItem
(
 DispenseId,
 DrugId,
 Quantity,
 Dose
)
VALUES
(
 @DispenseId,
 @DrugId,
 @Quantity,
 @Dose
);

END
