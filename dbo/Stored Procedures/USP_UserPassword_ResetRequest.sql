CREATE     PROCEDURE [dbo].[USP_UserPassword_ResetRequest]
(
    @UserId INT,
    @Token NVARCHAR(200),
    @ExpiryMinutes INT=30
)
AS
BEGIN

    SET NOCOUNT ON;

    UPDATE UserPasswordReset
    SET IsUsed=1
    WHERE UserId=@UserId
    AND IsUsed=0;

    INSERT INTO UserPasswordReset
    (
        UserId,
        Token,
        ExpiryTime,
        IsUsed
    )
    VALUES
    (
        @UserId,
        @Token,
        DATEADD(MINUTE,@ExpiryMinutes,GETDATE()),
        0
    );

END
