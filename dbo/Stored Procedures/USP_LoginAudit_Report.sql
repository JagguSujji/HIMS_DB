CREATE     PROCEDURE [dbo].[USP_LoginAudit_Report]
(
    @FromDate DATE,
    @ToDate DATE
)
AS
BEGIN

    SELECT
        LoginAuditId,
        Username,
        LoginDateTime,
        IsSuccessful,
        IPAddress,
        BrowserName,
        OperatingSystem,
        DeviceName
    FROM LoginAudit
    WHERE CAST(LoginDateTime AS DATE)
    BETWEEN @FromDate AND @ToDate
    ORDER BY LoginDateTime DESC;

END
