


/*******************************************************
 7. Create Lab Sample Collection
*******************************************************/
CREATE     PROCEDURE [dbo].[USP_LabSampleCollection_Create]
(
 @LabOrderId INT,
 @SampleTypeId INT,
 @CollectedBy INT
)
AS
BEGIN


DECLARE @Barcode VARCHAR(50)

SET @Barcode =
'LAB'+FORMAT(GETDATE(),'yyyyMMddHHmmss')


INSERT INTO dbo.LabSampleCollection
(
 LabOrderId,
 SampleTypeId,
 CollectedOn,
 CollectedBy,
 Barcode,
 Status
)
VALUES
(
 @LabOrderId,
 @SampleTypeId,
 GETDATE(),
 @CollectedBy,
 @Barcode,
 'COLLECTED'
);


SELECT SCOPE_IDENTITY() LabSampleId;

END
