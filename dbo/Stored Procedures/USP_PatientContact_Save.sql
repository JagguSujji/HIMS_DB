CREATE     PROCEDURE [dbo].[USP_PatientContact_Save]


(
 @PatientId BIGINT,

 @ContactType VARCHAR(50),

 @ContactValue VARCHAR(200)

)

AS
BEGIN


INSERT INTO dbo.PatientContact

(
PatientId,
ContactType,
ContactValue
)


VALUES

(
@PatientId,
@ContactType,
@ContactValue
);



END
