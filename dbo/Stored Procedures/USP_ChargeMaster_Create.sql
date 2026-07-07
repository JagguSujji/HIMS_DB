


--------------------------------------------------------------
-- 7. Create Charge Master
--------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_ChargeMaster_Create]
(
    @ChargeCode VARCHAR(50),
    @ChargeName VARCHAR(200),
    @Amount DECIMAL(18,2)
)
AS
BEGIN


    INSERT INTO dbo.ChargeMaster
    (
        ChargeCode,
        ChargeName,
        Amount
    )
    VALUES
    (
        @ChargeCode,
        @ChargeName,
        @Amount
    );


    SELECT SCOPE_IDENTITY()
    AS ChargeId;


END
