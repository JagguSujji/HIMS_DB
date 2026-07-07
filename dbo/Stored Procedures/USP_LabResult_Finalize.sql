


/*******************************************************
 13. Finalize Lab Result
*******************************************************/
CREATE     PROCEDURE [dbo].[USP_LabResult_Finalize]
(
 @LabResultId INT
)
AS
BEGIN


UPDATE dbo.LabResult

SET
ResultStatus='FINAL',
ResultDate=GETDATE()

WHERE LabResultId=@LabResultId;


END
