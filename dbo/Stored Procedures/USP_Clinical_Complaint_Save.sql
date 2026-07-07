CREATE     PROCEDURE [dbo].[USP_Clinical_Complaint_Save]


(
 @VisitId BIGINT,

 @ComplaintText VARCHAR(MAX)

)

AS
BEGIN


UPDATE dbo.Visit


SET

ChiefComplaintText=@ComplaintText


WHERE VisitId=@VisitId;



END
