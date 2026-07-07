CREATE     PROCEDURE [dbo].[USP_Lab_CriticalAlert_Check]


(
 @LabResultId BIGINT,
 @LabTestId BIGINT,
 @Value DECIMAL(18,2)
)

AS
BEGIN


DECLARE

@Min DECIMAL(18,2),

@Max DECIMAL(18,2);



SELECT

@Min=MinimumValue,

@Max=MaximumValue

FROM dbo.NormalRange

WHERE LabTestId=@LabTestId;



IF

@Value < @Min

OR

@Value > @Max

BEGIN


INSERT INTO dbo.CriticalLabAlertLog

(
LabResultId,
AlertLevel,
Message,
IsAcknowledged,
CreatedOn
)

VALUES

(
@LabResultId,
'HIGH',
'Abnormal Laboratory Result',
0,
GETDATE()
);



END



END
