



/************************************************************
 INSURANCE MASTER
************************************************************/


CREATE     PROCEDURE [dbo].[USP_InsuranceType_GetAll]
AS
BEGIN

SELECT *

FROM InsuranceType

WHERE IsActive=1

END
