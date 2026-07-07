


--------------------------------------------------------------
-- 2. Get Radiology Images
--------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_RadiologyImage_Get]
(
    @RadiologyResultId INT
)
AS
BEGIN

    SELECT

        ImageId,
        RadiologyResultId,
        ImageUrl,
        DicomUid,
        UploadedOn

    FROM dbo.RadiologyImageStorage

    WHERE RadiologyResultId=@RadiologyResultId

    ORDER BY UploadedOn DESC;

END
