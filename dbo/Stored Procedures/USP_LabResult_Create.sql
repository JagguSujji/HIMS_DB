


/*******************************************************
 11. Create Lab Result
*******************************************************/
CREATE     PROCEDURE [dbo].[USP_LabResult_Create]
(
 @LabOrderId INT,
 @ReviewedBy INT=NULL
)
AS
BEGIN


INSERT INTO dbo.LabResult
(
 LabOrderId,
 ResultDate,
 ResultStatus,
 ReviewedBy
)
VALUES
(
 @LabOrderId,
 GETDATE(),
 'DRAFT',
 @ReviewedBy
);


SELECT SCOPE_IDENTITY() LabResultId;

END
