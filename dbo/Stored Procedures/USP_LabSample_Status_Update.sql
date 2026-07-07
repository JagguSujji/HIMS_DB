CREATE     PROCEDURE [dbo].[USP_LabSample_Status_Update]


(
 @LabSampleId BIGINT,
 @Status VARCHAR(50)
)

AS
BEGIN


UPDATE dbo.LabSampleCollection

SET

Status=@Status


WHERE LabSampleId=@LabSampleId;



END
