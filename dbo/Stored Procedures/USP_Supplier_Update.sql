


CREATE     PROCEDURE [dbo].[USP_Supplier_Update]
(
 @SupplierId INT,
 @SupplierName VARCHAR(200),
 @Contact VARCHAR(100),
 @Email VARCHAR(100)
)
AS
BEGIN

UPDATE SupplierMaster

SET
SupplierName=@SupplierName,
Contact=@Contact,
Email=@Email

WHERE SupplierId=@SupplierId;

END
