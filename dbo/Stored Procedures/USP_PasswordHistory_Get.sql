CREATE     PROCEDURE [dbo].[USP_PasswordHistory_Get]
(
    @UserId BIGINT
)
AS
BEGIN

    SELECT

        PasswordHistoryId,
        PasswordHash,
        ChangedOn

    FROM dbo.PasswordHistory

    WHERE UserId=@UserId

    ORDER BY ChangedOn DESC;

END
