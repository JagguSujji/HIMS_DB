CREATE     PROCEDURE [dbo].[USP_ApplicationUser_GetAll]
(
    @SearchText NVARCHAR(100)=NULL
)
AS
BEGIN

    SELECT
        UserId,
        Username,
        EmailAddress,
        MobileNumber,
        IsLocked,
        IsActive,
        CreatedOn

    FROM dbo.ApplicationUser

    WHERE
    (
        @SearchText IS NULL
        OR Username LIKE '%'+@SearchText+'%'
        OR EmailAddress LIKE '%'+@SearchText+'%'
    )

    ORDER BY CreatedOn DESC;

END
