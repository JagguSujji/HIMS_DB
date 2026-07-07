CREATE     PROCEDURE [dbo].[USP_FrontDesk_QueueToken_Create]


(
 @PatientId BIGINT,
 @DepartmentId BIGINT,
 @TokenNumber VARCHAR(20)

)

AS
BEGIN


INSERT INTO dbo.QueueToken

(
PatientId,
DepartmentId,
TokenNumber,
Status
)

VALUES

(
@PatientId,
@DepartmentId,
@TokenNumber,
'WAITING'
);


END
