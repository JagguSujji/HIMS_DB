


/*******************************************************
 9. Create Sample Tracking
*******************************************************/
CREATE     PROCEDURE [dbo].[USP_LabSampleTracking_Create]
(
 @LabSampleId INT,
 @Location VARCHAR(100),
 @Status VARCHAR(50)
)
AS
BEGIN


INSERT INTO dbo.LabSampleTracking
(
 LabSampleId,
 Location,
 Status,
 UpdatedOn
)
VALUES
(
 @LabSampleId,
 @Location,
 @Status,
 GETDATE()
);


END
