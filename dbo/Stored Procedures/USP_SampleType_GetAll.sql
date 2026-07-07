



/************************************************************
 LAB / RADIOLOGY MASTER
************************************************************/


CREATE     PROCEDURE [dbo].[USP_SampleType_GetAll]
AS
BEGIN

SELECT *

FROM SampleType

WHERE IsActive=1

END
