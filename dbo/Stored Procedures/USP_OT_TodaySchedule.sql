CREATE     PROCEDURE [dbo].[USP_OT_TodaySchedule]


AS
BEGIN


SELECT


O.OTScheduleId,
O.OTDate,
S.SurgeryId,
P.UHID,
P.FirstName,
ST.SurgeryTypeName


FROM dbo.OTSchedule O


INNER JOIN dbo.Surgery S

ON O.SurgeryId=S.SurgeryId


INNER JOIN dbo.Patient P

ON S.PatientId=P.PatientId


INNER JOIN dbo.SurgeryType ST

ON S.SurgeryTypeId=ST.SurgeryTypeId


WHERE

CAST(O.OTDate AS DATE)=CAST(GETDATE() AS DATE);


END
