CREATE     PROCEDURE [dbo].[USP_Specialization_Create]
(
 @SpecializationCode VARCHAR(50),
 @SpecializationName VARCHAR(100),
 @Description VARCHAR(500),
 @CreatedBy BIGINT
)

AS
BEGIN


INSERT INTO dbo.Specialization
(
SpecializationCode,
SpecializationName,
Description,
IsActive,
--CreatedBy,
CreatedOn
)

VALUES
(
@SpecializationCode,
@SpecializationName,
@Description,
1,
--@CreatedBy,
GETDATE()
);


END
