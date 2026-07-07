CREATE     PROCEDURE [dbo].[USP_EmployeeQualification_Save]

(
 @EmployeeId BIGINT,
 @QualificationId BIGINT,
 @Institution VARCHAR(200),
 @YearCompleted INT,
 @RegistrationNumber VARCHAR(100)
)

AS
BEGIN


INSERT INTO dbo.EmployeeQualification
(
EmployeeId,
QualificationId,
Institution,
YearCompleted,
RegistrationNumber
)

VALUES
(
@EmployeeId,
@QualificationId,
@Institution,
@YearCompleted,
@RegistrationNumber
);


END
