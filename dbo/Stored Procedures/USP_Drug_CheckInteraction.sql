CREATE     PROCEDURE [dbo].[USP_Drug_CheckInteraction]

(
 @Drug1Id BIGINT,
 @Drug2Id BIGINT
)

AS
BEGIN


SELECT

Severity,
Description,
Recommendation


FROM dbo.DrugInteractionRule


WHERE


(
Drug1Id=@Drug1Id

AND

Drug2Id=@Drug2Id
)


OR


(
Drug1Id=@Drug2Id

AND

Drug2Id=@Drug1Id
);



END
