


CREATE     PROCEDURE [dbo].[USP_AIPromptVersion_Save]
(
 @PromptTemplateId INT,
 @VersionNumber INT,
 @PromptText NVARCHAR(MAX)
)
AS
BEGIN

INSERT INTO AIPromptVersion
(
 PromptTemplateId,
 VersionNumber,
 PromptText,
 CreatedOn
)
VALUES
(
 @PromptTemplateId,
 @VersionNumber,
 @PromptText,
 GETDATE()
)

END
