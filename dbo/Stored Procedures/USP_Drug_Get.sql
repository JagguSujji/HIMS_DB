CREATE     PROCEDURE [dbo].[USP_Drug_Get]

(
 @DrugCategoryId BIGINT=NULL
)

AS
BEGIN


SELECT

D.DrugId,

D.DrugName,

DC.DrugCategoryName


FROM dbo.Drug D


LEFT JOIN dbo.DrugCategory DC

ON D.DrugCategoryId=DC.DrugCategoryId



WHERE

(
@DrugCategoryId IS NULL

OR D.DrugCategoryId=@DrugCategoryId
);



END
