CREATE     PROCEDURE [dbo].[USP_PasswordHistory_Check]


(
 @UserId INT,

 @PasswordHash VARCHAR(MAX)

)

AS
BEGIN


SELECT COUNT(*) ExistingPassword


FROM PasswordHistory


WHERE


UserId=@UserId

AND

PasswordHash=@PasswordHash;



END
