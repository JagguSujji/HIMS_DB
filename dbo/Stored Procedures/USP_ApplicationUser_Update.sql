CREATE     PROCEDURE [dbo].[USP_ApplicationUser_Update]
(
    @UserId BIGINT,
    @EmailAddress NVARCHAR(200),
    @MobileNumber NVARCHAR(20),
    @ModifiedBy BIGINT
)
AS
BEGIN

    UPDATE dbo.ApplicationUser

    SET
        EmailAddress=@EmailAddress,
        MobileNumber=@MobileNumber,
        ModifiedBy=@ModifiedBy,
        ModifiedOn=GETDATE()

    WHERE UserId=@UserId;


END
