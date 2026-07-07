CREATE     PROCEDURE [dbo].[USP_Qualification_Create]
(
 @QualificationCode VARCHAR(50),
 @QualificationName VARCHAR(100),
 @Description VARCHAR(500),
 @CreatedBy BIGINT
)

AS
BEGIN


INSERT INTO dbo.Qualification
(
QualificationCode,
QualificationName,
Description,
IsActive,
--CreatedBy,
CreatedOn
)

VALUES
(
@QualificationCode,
@QualificationName,
@Description,
1,
--@CreatedBy,
GETDATE()
);


END
