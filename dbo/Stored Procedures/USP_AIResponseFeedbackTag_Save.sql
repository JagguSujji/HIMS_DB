


CREATE     PROCEDURE [dbo].[USP_AIResponseFeedbackTag_Save]
(
 @FeedbackId INT,
 @Tag VARCHAR(100)
)
AS
BEGIN

INSERT INTO AIResponseFeedbackTag
(
 FeedbackId,
 Tag
)
VALUES
(
 @FeedbackId,
 @Tag
)

END
