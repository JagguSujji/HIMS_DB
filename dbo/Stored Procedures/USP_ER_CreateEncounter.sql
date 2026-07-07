CREATE     PROCEDURE [dbo].[USP_ER_CreateEncounter]

(
 @ERVisitId BIGINT,
 @ProviderId BIGINT,

 @EncounterId BIGINT OUTPUT
)

AS
BEGIN


INSERT INTO dbo.Encounter

(
EncounterType,
StartTime,
ProviderId,
EncounterStatus,
NotesSummary
)

VALUES

(
'EMERGENCY',
GETDATE(),
@ProviderId,
'OPEN',
'ER Encounter'
);



SET @EncounterId=SCOPE_IDENTITY();


END
