



/************************************************************
 EVENT AUDIT
************************************************************/


CREATE     PROCEDURE [dbo].[USP_Event_Audit_Insert]
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


END
