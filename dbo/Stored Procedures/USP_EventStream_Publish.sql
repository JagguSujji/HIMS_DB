



/************************************************************
 REAL TIME EVENT STREAM
************************************************************/


CREATE     PROCEDURE [dbo].[USP_EventStream_Publish]
(
 @EventType VARCHAR(100),
 @Payload NVARCHAR(MAX),
 @SourceModule VARCHAR(100)
)
AS
BEGIN


INSERT INTO RealTimeEventStream
(
 EventType,
 Payload,
 SourceModule,
 CreatedOn
)
VALUES
(
 @EventType,
 @Payload,
 @SourceModule,
 GETDATE()
)


SELECT SCOPE_IDENTITY() EventId

END
