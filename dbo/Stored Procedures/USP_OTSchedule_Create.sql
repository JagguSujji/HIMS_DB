CREATE     PROCEDURE [dbo].[USP_OTSchedule_Create]

(
 @SurgeryId BIGINT,
 @OTDate DATETIME,

 @OTScheduleId BIGINT OUTPUT
)

AS
BEGIN


INSERT INTO dbo.OTSchedule

(
SurgeryId,
OTDate
)

VALUES

(
@SurgeryId,
@OTDate
);



SET @OTScheduleId=SCOPE_IDENTITY();


END
