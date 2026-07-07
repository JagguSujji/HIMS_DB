


-------------------------------------------------------------
-- 16. Slot Block Create
-------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_AppointmentSlotBlock_Create]
(
 @DoctorId INT,
 @BlockDate DATE,
 @StartTime TIME,
 @EndTime TIME,
 @Reason VARCHAR(500)
)
AS
BEGIN


INSERT INTO dbo.AppointmentSlotBlock
(
DoctorId,
BlockDate,
StartTime,
EndTime,
Reason,
CreatedOn
)
VALUES
(
@DoctorId,
@BlockDate,
@StartTime,
@EndTime,
@Reason,
GETDATE()
);


SELECT SCOPE_IDENTITY() BlockId;

END
