CREATE     PROCEDURE [dbo].[USP_Patient_Update]


(
 @PatientId BIGINT,

 @Mobile VARCHAR(20),

 @Email VARCHAR(150)

)

AS
BEGIN


UPDATE dbo.Patient


SET

Mobile=@Mobile,

Email=@Email


WHERE PatientId=@PatientId;



END
