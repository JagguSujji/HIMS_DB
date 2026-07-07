CREATE     PROCEDURE [dbo].[USP_UserOTP_Verify]
(
    @UserId INT,
    @OTPCode NVARCHAR(10)
)
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS
    (
        SELECT 1
        FROM UserOTP
        WHERE UserId=@UserId
        AND OTPCode=@OTPCode
        AND IsUsed=0
        AND ExpiryTime>=GETDATE()
    )
    BEGIN

        UPDATE UserOTP
        SET IsUsed=1
        WHERE UserId=@UserId
        AND OTPCode=@OTPCode;

        SELECT 1 AS IsValid;

    END
    ELSE
    BEGIN
        SELECT 0 AS IsValid;
    END

END
