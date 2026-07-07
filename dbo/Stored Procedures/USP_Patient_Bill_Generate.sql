CREATE     PROCEDURE [dbo].[USP_Patient_Bill_Generate]


(
 @PatientId BIGINT,
 @TotalAmount DECIMAL(18,2),

 @BillId BIGINT OUTPUT
)

AS
BEGIN


INSERT INTO dbo.Bill

(
PatientId,
BillDate,
TotalAmount
)

VALUES

(
@PatientId,
GETDATE(),
@TotalAmount
);



SET @BillId=SCOPE_IDENTITY();


END
