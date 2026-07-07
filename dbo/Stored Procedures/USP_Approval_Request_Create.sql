


/***********************************************************
 Approval Request Create
***********************************************************/
CREATE     PROCEDURE [dbo].[USP_Approval_Request_Create]
(
 @ReferenceId INT,
 @Amount DECIMAL(18,2)
)
AS
BEGIN


SELECT 
@ReferenceId ReferenceId,
@Amount Amount,
'PENDING' Status;


END
