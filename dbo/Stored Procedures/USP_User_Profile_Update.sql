CREATE     PROCEDURE [dbo].[USP_User_Profile_Update]
(
    @UserId INT,
    @FullName NVARCHAR(200),
    @Email NVARCHAR(200),
    @Mobile NVARCHAR(20)
)
AS
BEGIN

    UPDATE ApplicationUser
    SET
        FullName=@FullName,
        Email=@Email,
        Mobile=@Mobile
    WHERE UserId=@UserId;

END
