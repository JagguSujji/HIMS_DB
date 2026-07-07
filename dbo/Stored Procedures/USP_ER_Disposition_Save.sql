CREATE     PROCEDURE [dbo].[USP_ER_Disposition_Save]


(
 @ERVisitId BIGINT,

 @DispositionCode VARCHAR(50)

)

AS
BEGIN


UPDATE ERVisit

SET

Status=@DispositionCode


WHERE

ERVisitId=@ERVisitId;



END
