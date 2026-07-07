


--------------------------------------------------------------
-- 12. Create Patient Bill
--------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_Bill_Create]
(
    @PatientId INT,
    @TotalAmount DECIMAL(18,2)
)
AS
BEGIN


    INSERT INTO dbo.Bill
    (
        PatientId,
        BillDate,
        TotalAmount
    )
    VALUES
    (
        @PatientId,
        GETDATE(),
        @TotalAmount
    );


    SELECT SCOPE_IDENTITY()
    AS BillId;


END
