



/************************************************************
 AI RECOMMENDATION
************************************************************/


CREATE     PROCEDURE [dbo].[USP_AIRecommendation_Save]
(
 @RecommendationType VARCHAR(100),
 @RecommendationText NVARCHAR(MAX),
 @PriorityLevel VARCHAR(50)
)
AS
BEGIN

INSERT INTO AIRecommendation
(
 RecommendationType,
 RecommendationText,
 PriorityLevel,
 IsActive
)
VALUES
(
 @RecommendationType,
 @RecommendationText,
 @PriorityLevel,
 1
)

END
