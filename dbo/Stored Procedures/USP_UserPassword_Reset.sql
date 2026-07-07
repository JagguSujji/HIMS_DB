CREATE     PROCEDURE [dbo].[USP_UserPassword_Reset]
(
    @Token NVARCHAR(200),
    @PasswordHash NVARCHAR(MAX)
)
AS
BEGIN

    SET NOCOUNT ON;

    DECLARE @UserId INT;

    SELECT @UserId=UserId
    FROM UserPasswordReset
    WHERE Token=@Token
    AND IsUsed=0
    AND ExpiryTime>=GETDATE();

    IF @UserId IS NULL
    BEGIN
        RAISERROR('Invalid Token',16,1);
        RETURN;
    END

    UPDATE ApplicationUser
    SET PasswordHash=@PasswordHash
    WHERE UserId=@UserId;

    INSERT INTO PasswordHistory
    (
        UserId,
        PasswordHash,
        ChangedOn
    )
    VALUES
    (
        @UserId,
        @PasswordHash,
        GETDATE()
    );

    UPDATE UserPasswordReset
    SET IsUsed=1
    WHERE Token=@Token;

END
