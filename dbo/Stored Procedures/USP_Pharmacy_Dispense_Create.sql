CREATE     PROCEDURE [dbo].[USP_Pharmacy_Dispense_Create]


(
 @PrescriptionId BIGINT,
 @DispensedBy BIGINT,

 @DispenseId BIGINT OUTPUT
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



SET @DispenseId=SCOPE_IDENTITY();



UPDATE dbo.Prescription

SET

Status='DISPENSED'


WHERE PrescriptionId=@PrescriptionId;



END
