/************************************************************
 MODULE 12
 SECURITY / USER MANAGEMENT / ACCESS CONTROL
 Missing Stored Procedures Only
************************************************************/


/************************************************************
 Application Management
************************************************************/

CREATE     PROCEDURE [dbo].[USP_Application_GetAll]
AS
BEGIN

SELECT *
FROM Application
WHERE IsActive=1;

END
