CREATE     PROCEDURE [dbo].[USP_User_Profile]
(
    @UserId INT
)
AS
BEGIN

    SELECT
        UserId,
        UserName,
        FullName,
        Email,
        Mobile,
        UserTypeId,
        IsActive
    FROM ApplicationUser
    WHERE UserId=@UserId;

END
