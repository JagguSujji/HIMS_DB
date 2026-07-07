CREATE     PROCEDURE [dbo].[USP_PasswordHistory_Insert]


(
 @UserId INT,

 @PasswordHash VARCHAR(MAX),

 @ChangedBy INT

)

AS
BEGIN


INSERT INTO PasswordHistory

(
UserId,
PasswordHash,
ChangedOn,
ChangedBy
)


VALUES

(
@UserId,
@PasswordHash,
GETDATE(),
@ChangedBy
);



END
