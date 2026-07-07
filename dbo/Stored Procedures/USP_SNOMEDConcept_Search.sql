


/*******************************************************
 13. SNOMED Concept Search
*******************************************************/
CREATE     PROCEDURE [dbo].[USP_SNOMEDConcept_Search]
(
    @Search VARCHAR(200)
)
AS
BEGIN

    SELECT
        SNOMEDConceptId,
        ConceptId,
        FullySpecifiedName,
        PreferredTerm

    FROM dbo.SNOMEDConcept

    WHERE
    IsActive=1
    AND
    (
        PreferredTerm LIKE '%'+@Search+'%'
        OR FullySpecifiedName LIKE '%'+@Search+'%'
    );

END
