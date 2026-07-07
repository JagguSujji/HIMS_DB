CREATE     PROCEDURE [dbo].[USP_UserSession_GetActive]


(
 @UserId INT=NULL

)

AS
BEGIN


SELECT


*

FROM UserSession


WHERE


IsActive=1


AND

(@UserId IS NULL OR UserId=@UserId);



END
