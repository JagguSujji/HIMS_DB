



/************************************************************
 AI FEEDBACK
************************************************************/


CREATE     PROCEDURE [dbo].[USP_AIUserFeedback_Save]
(
 @AIRequestLogId INT,
 @Rating INT,
 @Comments VARCHAR(1000)
)
AS
BEGIN

INSERT INTO AIUserFeedback
(
 AIRequestLogId,
 Rating,
 Comments,
 CreatedOn
)
VALUES
(
 @AIRequestLogId,
 @Rating,
 @Comments,
 GETDATE()
)

END
