CREATE     PROCEDURE [dbo].[USP_Patient_Communication_Summary]


(
 @PatientId INT

)

AS
BEGIN


SELECT


'Notification' CommunicationType,

Message

--,CreatedOn


FROM PatientNotification


WHERE PatientId=@PatientId


UNION ALL


SELECT


'Clinical Alert',

Description

--,CreatedOn


FROM PatientAlert


WHERE PatientId=@PatientId;



END
