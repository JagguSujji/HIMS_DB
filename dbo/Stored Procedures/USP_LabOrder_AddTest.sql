CREATE     PROCEDURE [dbo].[USP_LabOrder_AddTest]


(
 @LabOrderId BIGINT,
 @LabTestId BIGINT
)

AS
BEGIN


INSERT INTO dbo.OrderDetail

(
OrderId,
ItemId,
Quantity,
Instructions
)

VALUES

(
@LabOrderId,
@LabTestId,
1,
'LAB TEST'
);



END
