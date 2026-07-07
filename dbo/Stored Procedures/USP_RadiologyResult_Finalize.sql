


--------------------------------------------------------------
-- 7. Finalize Radiology Result
--------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_RadiologyResult_Finalize]
(
    @RadiologyResultId INT
)
AS
BEGIN


    UPDATE dbo.RadiologyResult

    SET ResultDate=GETDATE()

    WHERE RadiologyResultId=
          @RadiologyResultId;


    UPDATE dbo.RadiologyWorklist

    SET Status='Completed'

    WHERE RadiologyOrderId =
    (
        SELECT RadiologyOrderId
        FROM dbo.RadiologyResult
        WHERE RadiologyResultId=@RadiologyResultId
    );


    SELECT 1 AS Success;

END
