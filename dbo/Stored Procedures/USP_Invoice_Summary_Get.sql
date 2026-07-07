


--------------------------------------------------------------
-- 5. Invoice Summary
--------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_Invoice_Summary_Get]
(
    @PatientId INT
)
AS
BEGIN


    SELECT

        InvoiceId,
        PatientId,
        TotalAmount,
        DiscountAmount,
        TaxAmount,
        PaidAmount,
        BalanceAmount,
        Status,
        CreatedOn

    FROM dbo.InvoiceHeader

    WHERE PatientId=@PatientId

    ORDER BY CreatedOn DESC;


END
