CREATE     PROCEDURE [dbo].[usp_GenerateAppointmentSlots]
(
      @DoctorId BIGINT,
      @BranchId BIGINT,
      @DepartmentId BIGINT,
      @FromDate DATE,
      @ToDate DATE
)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE
        @CurrentDate DATE,
        @WeekDay INT,
        @AvailabilityId BIGINT,
        @StartTime TIME,
        @EndTime TIME,
        @BreakStart TIME,
        @BreakEnd TIME,
        @Duration INT,
        @Capacity INT;

    SET @CurrentDate=@FromDate;

    WHILE @CurrentDate<=@ToDate
    BEGIN

        SET @WeekDay=DATEPART(WEEKDAY,@CurrentDate);

        SELECT
            @AvailabilityId=AvailabilityId,
            @StartTime=StartTime,
            @EndTime=EndTime,
            @BreakStart=BreakStartTime,
            @BreakEnd=BreakEndTime,
            @Duration=SlotDurationMinutes,
            @Capacity=MaxPatientsPerSlot
        FROM DoctorAvailability
        WHERE DoctorId=@DoctorId
        AND BranchId=@BranchId
        AND DepartmentId=@DepartmentId
        AND WeekdayId=@WeekDay
        AND IsActive=1
        AND @CurrentDate BETWEEN EffectiveFrom
                             AND ISNULL(EffectiveTo,'99991231');

        IF @AvailabilityId IS NOT NULL
        BEGIN

            IF NOT EXISTS
            (
                SELECT 1
                FROM DoctorLeave
                WHERE DoctorId=@DoctorId
                AND @CurrentDate BETWEEN FromDate AND ToDate
                AND IsApproved=1
            )
            BEGIN

                DECLARE @SlotStart TIME;

                SET @SlotStart=@StartTime;

                WHILE DATEADD(MINUTE,@Duration,@SlotStart)<=@EndTime
                BEGIN

                    IF NOT
                    (
                        @BreakStart IS NOT NULL
                        AND
                        @SlotStart>=@BreakStart
                        AND
                        @SlotStart<@BreakEnd
                    )
                    BEGIN

                        IF NOT EXISTS
                        (
                            SELECT 1
                            FROM AppointmentSlot
                            WHERE DoctorId=@DoctorId
                            AND SlotDate=@CurrentDate
                            AND StartTime=@SlotStart
                        )
                        BEGIN

                            INSERT INTO AppointmentSlot
                            (
                                AvailabilityId,
                                DoctorId,
                                BranchId,
                                DepartmentId,
                                SlotDate,
                                StartTime,
                                EndTime,
                                Capacity,
                                BookedCount,
                                SlotStatusId,
                                IsBlocked
                            )
                            VALUES
                            (
                                @AvailabilityId,
                                @DoctorId,
                                @BranchId,
                                @DepartmentId,
                                @CurrentDate,
                                @SlotStart,
                                DATEADD(MINUTE,@Duration,@SlotStart),
                                @Capacity,
                                0,
                                1,
                                0
                            );

                        END

                    END

                    SET @SlotStart=DATEADD(MINUTE,@Duration,@SlotStart);

                END

            END

        END

        SET @CurrentDate=DATEADD(DAY,1,@CurrentDate);

    END

END
