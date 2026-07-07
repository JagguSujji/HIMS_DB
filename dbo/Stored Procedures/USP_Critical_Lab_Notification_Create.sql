CREATE     PROCEDURE [dbo].[USP_Critical_Lab_Notification_Create]


(
 @LabResultId INT

)

AS
BEGIN


DECLARE 

@PatientId INT,

@Message NVARCHAR(MAX);



SELECT

@PatientId=P.PatientId,


@Message='Critical laboratory result detected. Immediate review required.'



FROM LabResult LR


INNER JOIN LabOrder LO

ON LR.LabOrderId=LO.LabOrderId


INNER JOIN Patient P

ON LO.PatientId=P.PatientId


WHERE

LR.LabResultId=@LabResultId;



INSERT INTO PatientNotification

(
PatientId,
Message,
IsRead,
CreatedOn
)


VALUES

(
@PatientId,
@Message,
0,
GETDATE()
);



END
