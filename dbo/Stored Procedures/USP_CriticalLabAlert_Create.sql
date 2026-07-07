


/*******************************************************
 15. Create Critical Lab Alert
*******************************************************/
CREATE     PROCEDURE [dbo].[USP_CriticalLabAlert_Create]
(
 @LabResultId INT,
 @AlertLevel VARCHAR(50),
 @Message VARCHAR(500)
)
AS
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
 @AlertLevel,
 @Message,
 0,
 GETDATE()
);


END
