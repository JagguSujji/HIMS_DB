



/************************************************************
 CLINICAL AI KNOWLEDGE
************************************************************/


CREATE     PROCEDURE [dbo].[USP_AIClinicalGuideline_Save]
(
 @GuidelineCode VARCHAR(50),
 @GuidelineName VARCHAR(200),
 @Specialty VARCHAR(100),
 @SourceOrganization VARCHAR(200),
 @GuidelineText NVARCHAR(MAX)
)
AS
BEGIN

INSERT INTO AIClinicalGuideline
(
 GuidelineCode,
 GuidelineName,
 Specialty,
 SourceOrganization,
 GuidelineText,
 EffectiveDate,
 IsActive
)
VALUES
(
 @GuidelineCode,
 @GuidelineName,
 @Specialty,
 @SourceOrganization,
 @GuidelineText,
 GETDATE(),
 1
)

END
