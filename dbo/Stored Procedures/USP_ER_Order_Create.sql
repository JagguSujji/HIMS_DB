CREATE     PROCEDURE [dbo].[USP_ER_Order_Create]


(
 @PatientId BIGINT,

 @EncounterId BIGINT,

 @OrderType VARCHAR(50)

)

AS
BEGIN


INSERT INTO dbo.OrderHeader

(
PatientId,
EncounterId,
OrderType,
OrderDate,
Status
)


VALUES

(
@PatientId,
@EncounterId,
@OrderType,
GETDATE(),
'OPEN'
);



END
