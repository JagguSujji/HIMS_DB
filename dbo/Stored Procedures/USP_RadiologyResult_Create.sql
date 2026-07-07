


--------------------------------------------------------------
-- 5. Create Radiology Result
--------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_RadiologyResult_Create]
(
    @RadiologyOrderId INT
)
AS
BEGIN


    INSERT INTO dbo.RadiologyResult
    (
        RadiologyOrderId,
        ResultDate
    )
    VALUES
    (
        @RadiologyOrderId,
        GETDATE()
    );


    SELECT SCOPE_IDENTITY()
    AS RadiologyResultId;


END
