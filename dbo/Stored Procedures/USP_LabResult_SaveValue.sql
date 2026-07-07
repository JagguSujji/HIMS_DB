CREATE     PROCEDURE [dbo].[USP_LabResult_SaveValue]


(
 @LabResultId BIGINT,
 @TestName VARCHAR(200),
 @ResultValue VARCHAR(100),
 @ResultUnitId BIGINT
)

AS
BEGIN


INSERT INTO dbo.OrderResult

(
OrderId,
ResultText,
ResultDate
)

VALUES

(
@LabResultId,
@TestName+' : '+@ResultValue,
GETDATE()
);



END
