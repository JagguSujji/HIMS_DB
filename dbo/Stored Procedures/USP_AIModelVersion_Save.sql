

CREATE     PROCEDURE [dbo].[USP_AIModelVersion_Save]
(
 @AIModelId INT,
 @VersionName VARCHAR(100),
 @ReleaseDate DATE,
 @IsDefault BIT
)
AS
BEGIN

 INSERT INTO AIModelVersion
 (
 AIModelId,
 VersionName,
 ReleaseDate,
 IsDefault,
 IsActive
 )
 VALUES
 (
 @AIModelId,
 @VersionName,
 @ReleaseDate,
 @IsDefault,
 1
 )

END
