


--------------------------------------------------------------
-- 8. Get Charge Master
--------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_ChargeMaster_GetAll]
AS
BEGIN


    SELECT

        ChargeId,
        ChargeCode,
        ChargeName,
        Amount

    FROM dbo.ChargeMaster

    ORDER BY ChargeName;


END
