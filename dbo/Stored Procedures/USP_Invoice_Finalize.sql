


--------------------------------------------------------------
-- 4. Finalize Invoice
--------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_Invoice_Finalize]
(
    @InvoiceId INT
)
AS
BEGIN


    UPDATE dbo.InvoiceHeader

    SET Status='Finalized'

    WHERE InvoiceId=@InvoiceId;


    SELECT 1 AS Success;


END
