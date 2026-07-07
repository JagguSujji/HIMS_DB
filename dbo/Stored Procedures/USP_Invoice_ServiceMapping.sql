CREATE     PROCEDURE [dbo].[USP_Invoice_ServiceMapping]

(
 @InvoiceId BIGINT,
 @ServiceId BIGINT,
 @EncounterId BIGINT,
 @Quantity INT
)

AS
BEGIN


DECLARE @Amount DECIMAL(18,2);


SELECT

@Amount=BasePrice

FROM dbo.ServiceCatalog

WHERE ServiceId=@ServiceId;



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
@Amount*@Quantity
);


END
