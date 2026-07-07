CREATE     PROCEDURE [dbo].[USP_IPD_DailyRoomCharge]


(
 @AdmissionId BIGINT,

 @Amount DECIMAL(18,2)

)

AS
BEGIN


DECLARE @PatientId BIGINT;


SELECT

@PatientId=PatientId

FROM Admission

WHERE AdmissionId=@AdmissionId;



INSERT INTO InvoiceHeader

(
PatientId,
TotalAmount,
Status,
CreatedOn
)


VALUES

(
@PatientId,
@Amount,
'OPEN',
GETDATE()
);



END
