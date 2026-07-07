


/*******************************************************
 17. Drug Interaction Check
*******************************************************/
CREATE     PROCEDURE [dbo].[USP_DrugInteraction_Check]
(
 @Drug1Id INT,
 @Drug2Id INT
)
AS
BEGIN


SELECT

DrugInteractionRuleId,
Severity,
Description,
Recommendation

FROM dbo.DrugInteractionRule

WHERE

(
Drug1Id=@Drug1Id
AND Drug2Id=@Drug2Id
)

OR

(
Drug1Id=@Drug2Id
AND Drug2Id=@Drug1Id
)

AND IsActive=1;


END
