


/*******************************************************
 2. Drug Search
*******************************************************/
CREATE     PROCEDURE [dbo].[USP_Drug_Search]
(
    @SearchText VARCHAR(100)
)
AS
BEGIN

    SELECT
        D.DrugId,
        D.DrugName,
        DC.DrugCategoryName

    FROM dbo.Drug D

    LEFT JOIN dbo.DrugCategory DC
    ON D.DrugCategoryId = DC.DrugCategoryId

    WHERE
    D.DrugName LIKE '%' + @SearchText + '%';

END
