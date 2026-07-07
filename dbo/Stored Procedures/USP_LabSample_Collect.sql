CREATE     PROCEDURE [dbo].[USP_LabSample_Collect]


(
 @LabOrderId BIGINT,

 @SampleTypeId BIGINT,

 @CollectedBy BIGINT,

 @Barcode VARCHAR(100),

 @LabSampleId BIGINT OUTPUT

)

AS
BEGIN


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
