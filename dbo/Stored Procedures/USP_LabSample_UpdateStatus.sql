


/*******************************************************
 8. Update Sample Status
*******************************************************/
CREATE     PROCEDURE [dbo].[USP_LabSample_UpdateStatus]
(
 @LabSampleId INT,
 @Status VARCHAR(50)
)
AS
BEGIN


UPDATE dbo.LabSampleCollection

SET Status=@Status

WHERE LabSampleId=@LabSampleId;


END
