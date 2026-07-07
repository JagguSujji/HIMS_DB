CREATE     PROCEDURE [dbo].[USP_EmployeeSpecialization_Save]

(
 @EmployeeId BIGINT,
 @SpecializationId BIGINT,
 @YearsOfExperience DECIMAL(5,2)
)

AS
BEGIN


INSERT INTO dbo.EmployeeSpecialization
(
EmployeeId,
SpecializationId,
YearsOfExperience
)

VALUES
(
@EmployeeId,
@SpecializationId,
@YearsOfExperience
);


END
