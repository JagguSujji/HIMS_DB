CREATE     PROCEDURE [dbo].[USP_Patient_Profile_Get]


(
 @PatientId BIGINT
)

AS
BEGIN


SELECT *


FROM dbo.Patient

WHERE PatientId=@PatientId;



SELECT *


FROM dbo.PatientAddress

WHERE PatientId=@PatientId;



SELECT *


FROM dbo.PatientContact

WHERE PatientId=@PatientId;



SELECT *


FROM dbo.PatientInsurance

WHERE PatientId=@PatientId;



SELECT *


FROM dbo.PatientAlert

WHERE PatientId=@PatientId;



END
