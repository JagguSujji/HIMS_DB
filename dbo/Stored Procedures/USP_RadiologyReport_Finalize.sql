


--------------------------------------------------------------
-- 9. Finalize Radiology Report
--------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_RadiologyReport_Finalize]
(
    @RadiologyResultId INT
)
AS
BEGIN


    UPDATE dbo.RadiologyResult

    SET ResultDate=GETDATE()

    WHERE RadiologyResultId=
          @RadiologyResultId;


    SELECT
    'FINALIZED' AS Status;


END
