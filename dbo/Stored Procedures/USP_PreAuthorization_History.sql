


/***********************************************************
 Pre Authorization History
***********************************************************/
CREATE     PROCEDURE [dbo].[USP_PreAuthorization_History]
(
 @PatientId INT
)
AS
BEGIN

SELECT *

FROM PreAuthorization

WHERE PatientId=@PatientId

ORDER BY PreAuthId DESC;

END
