


/************************************************************
 Data Access Policy
************************************************************/

CREATE     PROCEDURE [dbo].[USP_DataAccessPolicy_Save]
(
 @RoleId INT,
 @TableName VARCHAR(100),
 @CanRead BIT,
 @CanWrite BIT,
 @CanDelete BIT
)
AS
BEGIN


INSERT INTO DataAccessPolicy
(
RoleId,
TableName,
CanRead,
CanWrite,
CanDelete
)

VALUES
(
@RoleId,
@TableName,
@CanRead,
@CanWrite,
@CanDelete
)


END
