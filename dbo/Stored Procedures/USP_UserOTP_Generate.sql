CREATE     PROCEDURE [dbo].[USP_UserOTP_Generate]
(
    @UserId INT,
    @OTPCode NVARCHAR(10),
    @ExpiryMinutes INT = 10
)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE UserOTP
    SET IsUsed = 1
    WHERE UserId=@UserId
      AND IsUsed=0;

    INSERT INTO UserOTP
    (
        UserId,
        OTPCode,
        ExpiryTime,
        IsUsed
    )
    VALUES
    (
        @UserId,
        @OTPCode,
        DATEADD(MINUTE,@ExpiryMinutes,GETDATE()),
        0
    );
END
