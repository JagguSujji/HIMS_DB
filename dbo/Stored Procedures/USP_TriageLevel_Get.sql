CREATE     PROCEDURE [dbo].[USP_TriageLevel_Get]


AS
BEGIN


SELECT

TriageLevelId,
TriageCode,
TriageName,
DisplayColor,
PriorityOrder,
TargetResponseMinutes


FROM dbo.TriageLevel


WHERE IsActive=1


ORDER BY PriorityOrder;


END
