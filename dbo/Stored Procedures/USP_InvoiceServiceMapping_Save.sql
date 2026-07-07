CREATE     PROCEDURE [dbo].[USP_InvoiceServiceMapping_Save]


(
 @InvoiceId BIGINT,

 @ServiceId BIGINT,

 @EncounterId BIGINT,

 @Quantity INT,

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



END
