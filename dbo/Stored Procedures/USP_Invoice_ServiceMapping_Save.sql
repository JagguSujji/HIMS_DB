


--------------------------------------------------------------
-- 6. Save Invoice Service Mapping
--------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_Invoice_ServiceMapping_Save]
(
    @InvoiceId INT,
    @ServiceId INT,
    @EncounterId INT = NULL,
    @Quantity INT = 1,
    @Amount DECIMAL(18,2)
)
AS
BEGIN


    INSERT INTO dbo.InvoiceServiceMapping
    (
        InvoiceId,
        ServiceId,
        EncounterId,
        Quantity,
        Amount
    )
    VALUES
    (
        @InvoiceId,
        @ServiceId,
        @EncounterId,
        @Quantity,
        @Amount
    );


    SELECT SCOPE_IDENTITY()
    AS MappingId;

END
