



CREATE     PROCEDURE [dbo].[USP_Audit_Compliance_Report]
(
 @FromDate DATE,
 @ToDate DATE
)
AS
BEGIN


SELECT

TableName,

COUNT(*) ChangeCount


FROM AuditLog


WHERE ChangedOn BETWEEN @FromDate AND @ToDate


GROUP BY TableName


ORDER BY ChangeCount DESC


END
