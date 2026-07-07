


CREATE     PROCEDURE [dbo].[USP_CertificationType_GetAll]
AS
BEGIN

SELECT *

FROM CertificationType

WHERE IsActive=1;

END
