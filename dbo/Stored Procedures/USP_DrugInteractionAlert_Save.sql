


/*******************************************************
 18. Save Drug Interaction Alert
*******************************************************/
CREATE     PROCEDURE [dbo].[USP_DrugInteractionAlert_Save]
(
 @Drug1Id INT,
 @Drug2Id INT,
 @Severity VARCHAR(50),
 @AlertMessage VARCHAR(500)
)
AS
BEGIN


INSERT INTO dbo.DrugInteractionAlertLog
(
 Drug1Id,
 Drug2Id,
 Severity,
 AlertMessage,
 CreatedOn
)
VALUES
(
 @Drug1Id,
 @Drug2Id,
 @Severity,
 @AlertMessage,
 GETDATE()
);


END
