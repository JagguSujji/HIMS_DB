CREATE     PROCEDURE [dbo].[USP_RoleMenu_GetByRole]
(
 @RoleId BIGINT
)

AS
BEGIN


SELECT

M.MenuId,
M.MenuCode,
M.MenuName,
M.ParentMenuId

FROM dbo.RoleMenu RM

INNER JOIN dbo.Menu M

ON RM.MenuId=M.MenuId


WHERE RM.RoleId=@RoleId

AND M.IsActive=1;


END
