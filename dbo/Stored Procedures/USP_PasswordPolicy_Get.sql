CREATE     PROCEDURE [dbo].[USP_PasswordPolicy_Get]
AS
BEGIN

    SELECT TOP 1 *
    FROM PasswordPolicy;

END
