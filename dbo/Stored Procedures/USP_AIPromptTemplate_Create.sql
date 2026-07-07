


/************************************************************
 PROMPT MANAGEMENT
************************************************************/

CREATE     PROCEDURE [dbo].[USP_AIPromptTemplate_Create]
(
 @PromptCode VARCHAR(50),
 @PromptName VARCHAR(200),
 @ModuleName VARCHAR(100),
 @PromptText NVARCHAR(MAX),
 @Temperature DECIMAL(5,2),
 @MaxTokens INT
)
AS
BEGIN

INSERT INTO AIPromptTemplate
(
 PromptCode,
 PromptName,
 ModuleName,
 PromptText,
 Temperature,
 MaxTokens,
 IsActive
)
VALUES
(
 @PromptCode,
 @PromptName,
 @ModuleName,
 @PromptText,
 @Temperature,
 @MaxTokens,
 1
)

END
