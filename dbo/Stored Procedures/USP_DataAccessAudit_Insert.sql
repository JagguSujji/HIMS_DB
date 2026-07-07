CREATE     PROCEDURE [dbo].[USP_DataAccessAudit_Insert]


(
 @UserId INT,

 @EntityName VARCHAR(100),

 @EntityId INT,

 @ActionType VARCHAR(50),

 @IPAddress VARCHAR(100)

)

AS
BEGIN


INSERT INTO DataAccessAuditLog

(
UserId,
EntityName,
EntityId,
ActionType,
AccessedOn,
IPAddress
)


VALUES

(
@UserId,
@EntityName,
@EntityId,
@ActionType,
GETDATE(),
@IPAddress
);



END
