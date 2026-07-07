CREATE     PROCEDURE [dbo].[USP_Department_Create]
(
 @DepartmentCode VARCHAR(50),
 @DepartmentName VARCHAR(200),
 @DepartmentTypeId BIGINT,
 @IsClinical BIT,
 @Description VARCHAR(500),
 @CreatedBy BIGINT
)

AS
BEGIN


INSERT INTO dbo.Department
(
DepartmentCode,
DepartmentName,
DepartmentTypeId,
IsClinical,
Description,
IsActive,
CreatedBy,
CreatedOn
)

VALUES
(
@DepartmentCode,
@DepartmentName,
@DepartmentTypeId,
@IsClinical,
@Description,
1,
@CreatedBy,
GETDATE()
);


END
