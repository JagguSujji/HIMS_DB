/* ==========================================================
   MODULE 9 : BILLING & REVENUE CYCLE MANAGEMENT
   PART 1 : INVOICE + CHARGE + SERVICE MANAGEMENT
   ========================================================== */


--------------------------------------------------------------
-- 1. Create Invoice
--------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_Invoice_Create]
(
    @PatientId INT,
    @VisitId INT = NULL
)
AS
BEGIN

    SET NOCOUNT ON;


    INSERT INTO dbo.InvoiceHeader
    (
        PatientId,
        VisitId,
        TotalAmount,
        DiscountAmount,
        TaxAmount,
        InsuranceAmount,
        PaidAmount,
        --BalanceAmount,
        Status,
        CreatedOn
    )
    VALUES
    (
        @PatientId,
        @VisitId,
        0,
        0,
        0,
        0,
        0,
        --0,
        'Draft',
        GETDATE()
    );


    SELECT SCOPE_IDENTITY()
    AS InvoiceId;

END
