


/*******************************************************
 11. Pharmacy Dispense Create
*******************************************************/
CREATE     PROCEDURE [dbo].[USP_PharmacyDispense_Create]
(
 @PrescriptionId INT,
 @DispensedBy INT
)
AS
BEGIN


INSERT INTO dbo.PrescriptionDispense
(
 PrescriptionId,
 DispenseDate,
 DispensedBy
)
VALUES
(
 @PrescriptionId,
 GETDATE(),
 @DispensedBy
);


SELECT SCOPE_IDENTITY() DispenseId;


END
