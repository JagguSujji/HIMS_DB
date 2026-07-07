


CREATE     PROCEDURE [dbo].[USP_Application_Create]
(
 @ApplicationCode VARCHAR(50),
 @ApplicationName VARCHAR(100)
)
AS
BEGIN

INSERT INTO Application
(
 ApplicationCode,
 ApplicationName,
 IsActive
)
VALUES
(
 @ApplicationCode,
 @ApplicationName,
 1
)

SELECT SCOPE_IDENTITY() ApplicationId;

END
