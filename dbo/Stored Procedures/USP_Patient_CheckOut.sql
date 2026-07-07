CREATE     PROCEDURE [dbo].[USP_Patient_CheckOut]

(
 @VisitId BIGINT
)

AS
BEGIN


UPDATE dbo.Visit

SET

CheckOutTime=GETDATE(),

VisitStatusId=3


WHERE VisitId=@VisitId;


END
