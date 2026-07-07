CREATE     PROCEDURE [dbo].[USP_LabSample_Create]


(
 @LabOrderId BIGINT,
 @SampleTypeId BIGINT,
 @CollectedBy BIGINT,

 @LabSampleId BIGINT OUTPUT
)

AS
BEGIN


DECLARE @Barcode VARCHAR(50);


SET @Barcode=

'LAB'+

CONVERT(VARCHAR(20),
ABS(CHECKSUM(NEWID())));



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



SET @LabSampleId=SCOPE_IDENTITY();



END
