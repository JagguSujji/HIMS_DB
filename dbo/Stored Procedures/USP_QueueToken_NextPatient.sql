CREATE     PROCEDURE [dbo].[USP_QueueToken_NextPatient]


(
 @DepartmentId BIGINT
)

AS
BEGIN


SELECT TOP 1


TokenId,

PatientId,

TokenNumber


FROM dbo.QueueToken


WHERE

DepartmentId=@DepartmentId

AND

Status='WAITING'


ORDER BY TokenId;


END
