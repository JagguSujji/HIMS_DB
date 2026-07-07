


/*******************************************************
 6. Generate Sample Barcode
*******************************************************/
CREATE     PROCEDURE [dbo].[USP_LabSample_GenerateBarcode]
AS
BEGIN

DECLARE @Barcode VARCHAR(50)

SET @Barcode =
'LAB'+FORMAT(GETDATE(),'yyyyMMddHHmmss')


SELECT @Barcode Barcode;

END
