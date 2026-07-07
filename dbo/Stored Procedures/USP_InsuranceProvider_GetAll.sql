/*==========================================================
 Module 9 Part 3
 Insurance Billing
 Claims
 Pre Authorization
 Tariff
 Approval Workflow
 Denial Management
 Revenue Analytics
==========================================================*/


/***********************************************************
 Insurance Provider Master
***********************************************************/
CREATE     PROCEDURE [dbo].[USP_InsuranceProvider_GetAll]
AS
BEGIN

SELECT *
FROM InsuranceProvider
WHERE IsActive = 1;

END
