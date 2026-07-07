


---------------------------------------------------------------
-- 14. Episode Close
---------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_Episode_Close]
(
 @EpisodeId INT
)
AS
BEGIN

UPDATE dbo.EpisodeOfCare
SET
Status='CLOSED',
EndDate=GETDATE()

WHERE EpisodeId=@EpisodeId;

END
