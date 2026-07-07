CREATE     PROCEDURE [dbo].[USP_InvoiceLine_Add]


(
 @InvoiceId BIGINT,

 @ServiceName VARCHAR(200),

 @Amount DECIMAL(18,2)

)

AS
BEGIN


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

SET

TotalAmount=

(
SELECT SUM(Amount)

FROM InvoiceLineItem

WHERE InvoiceId=@InvoiceId
)


WHERE InvoiceId=@InvoiceId;



END
