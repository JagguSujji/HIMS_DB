CREATE     PROCEDURE [dbo].[USP_LabSampleTracking_Save]


(
 @LabSampleId BIGINT,

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



UPDATE dbo.LabSampleCollection

SET

Status=@Status


WHERE LabSampleId=@LabSampleId;



END
