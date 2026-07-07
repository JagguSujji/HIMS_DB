


/************************************************************
 Security Dashboard
************************************************************/

CREATE     PROCEDURE [dbo].[USP_Security_Dashboard]
AS
BEGIN


SELECT

(SELECT COUNT(*)
FROM ApplicationUser
WHERE IsLocked=1)
LockedUsers,


(SELECT COUNT(*)
FROM LoginAudit
WHERE IsSuccessful=0)
FailedLogins,


(SELECT COUNT(*)
FROM UserSession
WHERE IsActive=1)
ActiveSessions,


(SELECT COUNT(*)
FROM AuditLog)
AuditRecords;


END
