CREATE     PROCEDURE [dbo].[USP_Branch_GetAll]
(
 @HospitalId BIGINT
)

AS
BEGIN


SELECT

BranchId,
BranchCode,
BranchName,
PhoneNumber,
City,
State,
IsMainBranch,
IsActive

FROM dbo.Branch

WHERE HospitalId=@HospitalId

ORDER BY BranchName;


END
