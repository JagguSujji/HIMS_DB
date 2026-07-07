CREATE     PROCEDURE [dbo].[USP_ER_Encounter_Create]


(
 @ERVisitId BIGINT,

 @ProviderId BIGINT,

 @LocationId BIGINT,

 @EncounterId BIGINT OUTPUT

)

AS
BEGIN


DECLARE @PatientId BIGINT;


SELECT

@PatientId=PatientId

FROM ERVisit

WHERE ERVisitId=@ERVisitId;



INSERT INTO dbo.Encounter

(
VisitId,
EncounterType,
StartTime,
ProviderId,
EncounterStatus,
LocationId
)


VALUES

(
NULL,
'EMERGENCY',
GETDATE(),
@ProviderId,
'OPEN',
@LocationId
);



SET @EncounterId=SCOPE_IDENTITY();



END
