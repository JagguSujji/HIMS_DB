CREATE     PROCEDURE [dbo].[USP_Master_Dashboard]


AS
BEGIN


SELECT

(SELECT COUNT(*) FROM Department)
Departments,


(SELECT COUNT(*) FROM ServiceCatalog)
Services,


(SELECT COUNT(*) FROM Drug)
Drugs,


(SELECT COUNT(*) FROM LabTest)
LabTests,


(SELECT COUNT(*) FROM InsuranceProvider)
InsuranceProviders;



END
