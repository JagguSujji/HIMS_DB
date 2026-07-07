


/*******************************************************
 12. Save Lab Result
*******************************************************/
CREATE     PROCEDURE [dbo].[USP_LabResult_Save]
(
 @LabResultId INT,
 @ResultStatus VARCHAR(50)
)
AS
BEGIN


UPDATE dbo.LabResult

SET
ResultStatus=@ResultStatus

WHERE LabResultId=@LabResultId;


END
