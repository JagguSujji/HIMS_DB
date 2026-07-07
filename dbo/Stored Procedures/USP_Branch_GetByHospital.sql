


CREATE     PROCEDURE [dbo].[USP_Branch_GetByHospital]
(
 @HospitalId INT
)
AS
BEGIN

SELECT *

FROM Branch

WHERE HospitalId=@HospitalId

AND IsActive=1

END
