


/************************************************************
 AI ROUTING RULE
************************************************************/

CREATE     PROCEDURE [dbo].[USP_AIModelRoutingRule_Save]
(
 @IntentId INT,
 @ModelId INT,
 @Priority INT
)
AS
BEGIN

INSERT INTO AIModelRoutingRule
(
 IntentId,
 ModelId,
 Priority
)
VALUES
(
 @IntentId,
 @ModelId,
 @Priority
)

END
