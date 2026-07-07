CREATE     PROCEDURE [dbo].[USP_Surgery_AssignSurgeon]

(
 @SurgeryId BIGINT,
 @DoctorId BIGINT
)

AS
BEGIN


UPDATE dbo.Surgery

SET

SurgeryTypeId=SurgeryTypeId


WHERE SurgeryId=@SurgeryId;



INSERT INTO dbo.Consultation

(
EncounterId,
DoctorId,
Notes
)

VALUES

(
NULL,
@DoctorId,
'Surgery Surgeon Assigned'
);


END
