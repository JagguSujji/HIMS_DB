CREATE     PROCEDURE [dbo].[USP_ERVisit_Create]

(
 @PatientId BIGINT,

 @ArrivalModeId BIGINT,

 @SeverityLevel VARCHAR(50),

 @Status VARCHAR(50),

 @ERVisitId BIGINT OUTPUT

)

AS
BEGIN


INSERT INTO dbo.ERVisit

(
PatientId,
ArrivalTime,
SeverityLevel,
Status
)


VALUES

(
@PatientId,
GETDATE(),
@SeverityLevel,
@Status
);



SET @ERVisitId=SCOPE_IDENTITY();



END
