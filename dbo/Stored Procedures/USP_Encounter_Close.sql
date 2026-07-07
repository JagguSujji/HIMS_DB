CREATE     PROCEDURE [dbo].[USP_Encounter_Close]


(
 @EncounterId BIGINT
)

AS
BEGIN


UPDATE dbo.Encounter


SET

EndTime=GETDATE(),

EncounterStatus='COMPLETED'


WHERE EncounterId=@EncounterId;



END
