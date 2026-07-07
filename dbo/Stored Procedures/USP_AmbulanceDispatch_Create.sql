CREATE     PROCEDURE [dbo].[USP_AmbulanceDispatch_Create]


(
 @PatientId BIGINT,

 @Location VARCHAR(200)

)

AS
BEGIN


INSERT INTO dbo.AmbulanceDispatch

(
PatientId,
Location,
Status,
DispatchedOn
)


VALUES

(
@PatientId,
@Location,
'DISPATCHED',
GETDATE()
);



END
