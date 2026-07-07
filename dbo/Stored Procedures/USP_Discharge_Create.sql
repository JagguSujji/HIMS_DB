CREATE     PROCEDURE [dbo].[USP_Discharge_Create]


(
 @AdmissionId BIGINT,

 @PatientId BIGINT,

 @SummaryText VARCHAR(MAX),

 @FollowUpInstructions VARCHAR(MAX)

)

AS
BEGIN


INSERT INTO dbo.DischargeSummary

(
AdmissionId,
PatientId,
SummaryText,
FollowUpInstructions,
CreatedOn
)


VALUES

(
@AdmissionId,
@PatientId,
@SummaryText,
@FollowUpInstructions,
GETDATE()
);



UPDATE dbo.Admission

SET


DischargeDate=GETDATE(),

AdmissionStatusId=3



WHERE AdmissionId=@AdmissionId;



UPDATE dbo.Bed

SET

IsOccupied=0


WHERE BedId=

(
SELECT BedId

FROM Admission

WHERE AdmissionId=@AdmissionId
);



END
