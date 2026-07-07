CREATE     PROCEDURE [dbo].[USP_Surgery_UpdateDate]

(
 @SurgeryId BIGINT,
 @SurgeryDate DATETIME
)

AS
BEGIN


UPDATE dbo.Surgery

SET

SurgeryDate=@SurgeryDate


WHERE SurgeryId=@SurgeryId;


END
