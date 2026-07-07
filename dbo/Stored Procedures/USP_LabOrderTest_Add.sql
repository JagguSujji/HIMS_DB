


/*******************************************************
 5. Add Lab Order Test
*******************************************************/
CREATE     PROCEDURE [dbo].[USP_LabOrderTest_Add]
(
 @LabOrderId INT,
 @LabTestId INT
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
 NULL
);


END
