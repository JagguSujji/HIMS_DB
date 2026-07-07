CREATE     PROCEDURE [dbo].[USP_AppointmentSlot_Generate]


(
 @DoctorId BIGINT,

 @FromDate DATE,

 @ToDate DATE,

 @SlotDuration INT
)


AS
BEGIN


DECLARE 
@CurrentDate DATE;


SET @CurrentDate=@FromDate;



WHILE @CurrentDate<=@ToDate

BEGIN


DECLARE

@StartTime TIME,

@EndTime TIME;



SELECT

@StartTime=StartTime,

@EndTime=EndTime


FROM dbo.DoctorSchedule


WHERE

DoctorId=@DoctorId

AND DayOfWeek=
DATEPART(WEEKDAY,@CurrentDate);



IF @StartTime IS NOT NULL

BEGIN



DECLARE @SlotStart TIME;


SET @SlotStart=@StartTime;



WHILE DATEADD
(
MINUTE,
@SlotDuration,
@SlotStart
)<=@EndTime


BEGIN



INSERT INTO dbo.AppointmentSlot

(
DoctorId,
SlotDate,
StartTime,
EndTime,
IsBooked
)

VALUES

(
@DoctorId,
@CurrentDate,
@SlotStart,

DATEADD
(
MINUTE,
@SlotDuration,
@SlotStart
),

0
);



SET @SlotStart=

DATEADD
(
MINUTE,
@SlotDuration,
@SlotStart
);



END



END



SET @CurrentDate=

DATEADD
(
DAY,
1,
@CurrentDate
);



END


END
