


CREATE     PROCEDURE [dbo].[USP_AIKnowledgeSource_Save]
(
 @SourceName VARCHAR(200),
 @SourceType VARCHAR(100),
 @Website VARCHAR(500)
)
AS
BEGIN

INSERT INTO AIKnowledgeSource
(
 SourceName,
 SourceType,
 Website,
 IsActive
)
VALUES
(
 @SourceName,
 @SourceType,
 @Website,
 1
)

END
