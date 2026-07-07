


/*--------------------------------------------------------
 Clinical Document Save
--------------------------------------------------------*/
CREATE     PROCEDURE [dbo].[USP_ClinicalDocument_Save]
(
 @PatientId INT,
 @DocumentType VARCHAR(100),
 @DocumentPath VARCHAR(500),
 @CreatedBy INT
)
AS
BEGIN

INSERT INTO ClinicalDocument
(
 PatientId,
 DocumentType,
 DocumentPath,
 CreatedOn,
 CreatedBy
)
VALUES
(
 @PatientId,
 @DocumentType,
 @DocumentPath,
 GETDATE(),
 @CreatedBy
);


SELECT SCOPE_IDENTITY() ClinicalDocumentId;

END
