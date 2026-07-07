


/*******************************************************
 21. Lab Result Verification
*******************************************************/
CREATE     PROCEDURE [dbo].[USP_LabResult_Verify]
(
 @LabResultId INT,
 @VerifiedBy INT
)
AS
BEGIN


UPDATE dbo.LabResult

SET
ReviewedBy=@VerifiedBy,
ReviewedOn=GETDATE(),
ResultStatus='VERIFIED'

WHERE LabResultId=@LabResultId;


END
