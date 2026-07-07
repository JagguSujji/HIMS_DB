CREATE     PROCEDURE [dbo].[USP_IP_GenerateDailyCharges]


(
 @AdmissionId BIGINT
)

AS
BEGIN


DECLARE @RoomCharge DECIMAL(18,2);



SELECT

@RoomCharge=R.ChargePerDay


FROM dbo.Admission A

INNER JOIN dbo.Room R

ON A.RoomId=R.RoomId


WHERE A.AdmissionId=@AdmissionId;



INSERT INTO dbo.InvoiceLineItem

(
InvoiceId,
ServiceName,
Amount
)

SELECT

InvoiceId,
'Room Charges',
@RoomCharge


FROM dbo.InvoiceHeader

WHERE PatientId=

(
SELECT PatientId
FROM Admission
WHERE AdmissionId=@AdmissionId
);



END
