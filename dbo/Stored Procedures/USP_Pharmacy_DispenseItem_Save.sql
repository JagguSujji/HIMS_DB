CREATE     PROCEDURE [dbo].[USP_Pharmacy_DispenseItem_Save]


(
 @DispenseId BIGINT,
 @DrugId BIGINT,
 @Quantity DECIMAL(18,2)
)

AS
BEGIN


DECLARE @BatchId BIGINT;



SELECT TOP 1

@BatchId=BatchId

FROM dbo.DrugStockBatch


WHERE

DrugId=@DrugId

AND Quantity>=@Quantity

AND ExpiryDate>GETDATE()


ORDER BY ExpiryDate;



INSERT INTO dbo.PrescriptionDispenseItem

(
DispenseId,
DrugId,
Quantity
)

VALUES

(
@DispenseId,
@DrugId,
@Quantity
);



UPDATE dbo.DrugStockBatch

SET

Quantity=Quantity-@Quantity


WHERE BatchId=@BatchId;



INSERT INTO dbo.DrugInventoryMovement

(
DrugId,
BatchId,
MovementType,
Quantity,
ReferenceId,
MovementDate
)

VALUES

(
@DrugId,
@BatchId,
'DISPENSE',
@Quantity,
@DispenseId,
GETDATE()
);



END
