


CREATE     PROCEDURE [dbo].[USP_AIPromptTemplate_Get]
(
 @ModuleName VARCHAR(100)
)
AS
BEGIN

SELECT *
FROM AIPromptTemplate
WHERE ModuleName=@ModuleName
AND IsActive=1

END
