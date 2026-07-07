/************************************************************
 MODULE 16
 MASTER DATA MANAGEMENT
 MISSING STORED PROCEDURES ONLY
************************************************************/


/************************************************************
 ADDRESS MASTER
************************************************************/

CREATE     PROCEDURE [dbo].[USP_AddressType_GetAll]
AS
BEGIN

SELECT *
FROM AddressType
WHERE IsActive=1

END
