


--------------------------------------------------------------
-- 2. Add Invoice Line Item
--------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_Invoice_AddLine]
(
    @InvoiceId INT,
    @ServiceName VARCHAR(200),
    @Amount DECIMAL(18,2)
)
AS
BEGIN

    SET NOCOUNT ON;


    INSERT INTO dbo.InvoiceLineItem
    (
        InvoiceId,
        ServiceName,
        Amount
    )
    VALUES
    (
        @InvoiceId,
        @ServiceName,
        @Amount
    );


    UPDATE dbo.InvoiceHeader

    SET TotalAmount =
    (
        SELECT SUM(Amount)
        FROM dbo.InvoiceLineItem
        WHERE InvoiceId=@InvoiceId
    )

    WHERE InvoiceId=@InvoiceId;


    SELECT SCOPE_IDENTITY()
    AS InvoiceLineId;

END
