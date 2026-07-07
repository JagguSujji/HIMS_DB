


-------------------------------------------------------------
-- 5. Appointment Token Create
-------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_AppointmentToken_Create]
(
 @AppointmentId INT,
 @DoctorId INT,
 @SlotId INT,
 @TokenNumber INT
)
AS
BEGIN

SET NOCOUNT ON;


INSERT INTO dbo.AppointmentToken
(
AppointmentId,
DoctorId,
SlotId,
TokenNumber,
IssuedOn,
Status
)
VALUES
(
@AppointmentId,
@DoctorId,
@SlotId,
@TokenNumber,
GETDATE(),
'WAITING'
);


SELECT SCOPE_IDENTITY() TokenId;


END
