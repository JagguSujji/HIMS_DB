CREATE     PROCEDURE [dbo].[USP_Surgery_Create]


(
 @PatientId BIGINT,
 @SurgeryDate DATETIME,
 @SurgeryTypeId BIGINT,

 @SurgeryId BIGINT OUTPUT
)

AS
BEGIN


INSERT INTO dbo.Surgery

(
PatientId,
SurgeryDate,
SurgeryTypeId
)

VALUES

(
@PatientId,
@SurgeryDate,
@SurgeryTypeId
);



SET @SurgeryId=SCOPE_IDENTITY();


END
