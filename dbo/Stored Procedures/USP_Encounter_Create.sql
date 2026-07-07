CREATE     PROCEDURE [dbo].[USP_Encounter_Create]


(
 @VisitId BIGINT,
 @ProviderId BIGINT,

 @EncounterId BIGINT OUTPUT

)

AS
BEGIN


INSERT INTO dbo.Encounter

(
VisitId,
EncounterType,
StartTime,
ProviderId,
EncounterStatus
)

VALUES

(
@VisitId,
'CONSULTATION',
GETDATE(),
@ProviderId,
'OPEN'
);



SET @EncounterId=SCOPE_IDENTITY();



END
