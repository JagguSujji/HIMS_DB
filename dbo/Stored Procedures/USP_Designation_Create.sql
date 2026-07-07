CREATE     PROCEDURE [dbo].[USP_Designation_Create]
(
 @DesignationCode VARCHAR(50),
 @DesignationName VARCHAR(100),
 @IsClinical BIT,
 @CreatedBy BIGINT
)

AS
BEGIN


INSERT INTO dbo.Designation
(
DesignationCode,
DesignationName,
IsClinical,
IsActive,
CreatedBy,
CreatedOn
)

VALUES
(
@DesignationCode,
@DesignationName,
@IsClinical,
1,
@CreatedBy,
GETDATE()
);


END
