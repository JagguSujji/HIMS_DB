CREATE     PROCEDURE [dbo].[USP_ER_To_Admission]


(
 @ERVisitId BIGINT,

 @AdmissionId BIGINT OUTPUT

)

AS
BEGIN


DECLARE @PatientId BIGINT;



SELECT

@PatientId=PatientId

FROM ERVisit

WHERE ERVisitId=@ERVisitId;



INSERT INTO Admission

(
PatientId,
AdmissionDate,
AdmissionStatusId
)


VALUES

(
@PatientId,
GETDATE(),
1
);



SET @AdmissionId=SCOPE_IDENTITY();



UPDATE ERVisit

SET

Status='ADMITTED'


WHERE ERVisitId=@ERVisitId;



END
