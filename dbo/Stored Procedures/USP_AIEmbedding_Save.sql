


CREATE     PROCEDURE [dbo].[USP_AIEmbedding_Save]
(
 @SourceType VARCHAR(100),
 @SourceId INT,
 @VectorData VARBINARY(MAX)
)
AS
BEGIN

INSERT INTO AIEmbedding
(
 SourceType,
 SourceId,
 VectorData
)
VALUES
(
 @SourceType,
 @SourceId,
 @VectorData
)

END
