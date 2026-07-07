CREATE     PROCEDURE [dbo].[USP_DoctorSchedule_Save]


(
 @DoctorId BIGINT,
 @DayOfWeek INT,
 @StartTime TIME,
 @EndTime TIME
)

AS
BEGIN


INSERT INTO dbo.DoctorSchedule

(
DoctorId,
DayOfWeek,
StartTime,
EndTime
)

VALUES

(
@DoctorId,
@DayOfWeek,
@StartTime,
@EndTime
);


END
