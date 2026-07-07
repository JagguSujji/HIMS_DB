


/*******************************************************
 12. Symptom Ontology Search
*******************************************************/
CREATE     PROCEDURE [dbo].[USP_SymptomOntology_Search]
(
    @Search VARCHAR(100)
)
AS
BEGIN

    SELECT
        SymptomOntologyId,
        SymptomCode,
        SymptomName,
        ParentSymptomId,
        SeverityLevel

    FROM dbo.AISymptomOntology

    WHERE
    IsActive=1
    AND
    SymptomName LIKE '%'+@Search+'%';

END
