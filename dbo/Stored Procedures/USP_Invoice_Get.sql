


--------------------------------------------------------------
-- 3. Get Invoice Details
--------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_Invoice_Get]
(
    @InvoiceId INT
)
AS
BEGIN

    SELECT

        IH.InvoiceId,
        IH.PatientId,
        IH.VisitId,
        IH.TotalAmount,
        IH.DiscountAmount,
        IH.TaxAmount,
        IH.PaidAmount,
        IH.BalanceAmount,
        IH.Status,
        IH.CreatedOn,

        IL.InvoiceLineId,
        IL.ServiceName,
        IL.Amount


    FROM dbo.InvoiceHeader IH

    LEFT JOIN dbo.InvoiceLineItem IL

        ON IH.InvoiceId=IL.InvoiceId


    WHERE IH.InvoiceId=@InvoiceId;


END
