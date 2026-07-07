CREATE     PROCEDURE [dbo].[USP_PasswordPolicy_Update]
(
    @PasswordPolicyId INT,
    @MinLength INT,
    @MaxLength INT,
    @RequireSpecialChar BIT,
    @RequireNumber BIT,
    @RequireUpperCase BIT,
    @ExpiryDays INT
)
AS
BEGIN

    UPDATE PasswordPolicy
    SET
        MinLength=@MinLength,
        MaxLength=@MaxLength,
        RequireSpecialChar=@RequireSpecialChar,
        RequireNumber=@RequireNumber,
        RequireUpperCase=@RequireUpperCase,
        ExpiryDays=@ExpiryDays
    WHERE PasswordPolicyId=@PasswordPolicyId;

END
