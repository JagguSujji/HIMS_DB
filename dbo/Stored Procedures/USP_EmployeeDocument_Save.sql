


/***********************************************************
 Employee Documents
***********************************************************/

CREATE     PROCEDURE [dbo].[USP_EmployeeDocument_Save]
(
 @EmployeeId INT,
 @EmployeeDocumentTypeId INT,
 @DocumentNumber VARCHAR(100),
 @FilePath VARCHAR(500)
)
AS
BEGIN

INSERT INTO EmployeeDocument
(
EmployeeId,
EmployeeDocumentTypeId,
DocumentNumber,
FilePath,
UploadedOn
)

VALUES
(
@EmployeeId,
@EmployeeDocumentTypeId,
@DocumentNumber,
@FilePath,
GETDATE()
)

END
