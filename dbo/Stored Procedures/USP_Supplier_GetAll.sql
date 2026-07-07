


CREATE     PROCEDURE [dbo].[USP_Supplier_GetAll]
AS
BEGIN

SELECT *
FROM SupplierMaster
WHERE IsActive=1;

END
