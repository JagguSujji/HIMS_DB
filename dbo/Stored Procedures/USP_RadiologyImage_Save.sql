/* ==========================================================
   MODULE 8 : RADIOLOGY / IMAGING MANAGEMENT
   PART 3 : IMAGE STORAGE + DASHBOARD + REPORTING
   ========================================================== */


--------------------------------------------------------------
-- 1. Save Radiology Image
--------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_RadiologyImage_Save]
(
    @RadiologyResultId INT,
    @ImageUrl VARCHAR(500),
    @DicomUid VARCHAR(200)
)
AS
BEGIN

    SET NOCOUNT ON;


    INSERT INTO dbo.RadiologyImageStorage
    (
        RadiologyResultId,
        ImageUrl,
        DicomUid,
        UploadedOn
    )
    VALUES
    (
        @RadiologyResultId,
        @ImageUrl,
        @DicomUid,
        GETDATE()
    );


    SELECT SCOPE_IDENTITY()
    AS ImageId;

END
