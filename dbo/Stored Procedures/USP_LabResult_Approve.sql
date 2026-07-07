CREATE     PROCEDURE [dbo].[USP_LabResult_Approve]


(
 @LabResultId BIGINT,

 @ReviewedBy BIGINT

)

AS
BEGIN


UPDATE dbo.LabResult

SET


ResultStatus='APPROVED',

ReviewedBy=@ReviewedBy,

ReviewedOn=GETDATE()



WHERE LabResultId=@LabResultId;



END
