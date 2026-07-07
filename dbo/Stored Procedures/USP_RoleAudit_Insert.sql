CREATE     PROCEDURE [dbo].[USP_RoleAudit_Insert]


(
 @RoleId INT,

 @Action VARCHAR(50),

 @ChangedBy INT

)

AS
BEGIN


INSERT INTO RoleAuditLog

(
RoleId,
Action,
ChangedOn,
ChangedBy
)


VALUES

(
@RoleId,
@Action,
GETDATE(),
@ChangedBy
);



END
