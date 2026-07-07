


/*******************************************************
 3. Create Drug
*******************************************************/
CREATE     PROCEDURE [dbo].[USP_Drug_Create]
(
    @DrugName VARCHAR(200),
    @DrugCategoryId INT
)
AS
BEGIN

    INSERT INTO dbo.Drug
    (
        DrugName,
        DrugCategoryId
    )
    VALUES
    (
        @DrugName,
        @DrugCategoryId
    );

END
