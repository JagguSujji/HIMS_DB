


/***********************************************************
 Supplier Management
 Table SupplierMaster
***********************************************************/

CREATE     PROCEDURE [dbo].[USP_Supplier_Create]
(
 @SupplierName VARCHAR(200),
 @Contact VARCHAR(100),
 @Email VARCHAR(100)
)
AS
BEGIN

INSERT INTO SupplierMaster
(
 SupplierName,
 Contact,
 Email,
 IsActive
)
VALUES
(
 @SupplierName,
 @Contact,
 @Email,
 1
)

SELECT SCOPE_IDENTITY() SupplierId;

END
