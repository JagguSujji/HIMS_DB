


/*******************************************************
 2. Search Lab Test
*******************************************************/
CREATE     PROCEDURE [dbo].[USP_LabTest_Search]
(
    @SearchText VARCHAR(100)
)
AS
BEGIN

    SELECT
        LabTestId,
        TestCode,
        TestName
    FROM dbo.LabTest

    WHERE
    IsActive=1
    AND
    (
        TestName LIKE '%'+@SearchText+'%'
        OR TestCode LIKE '%'+@SearchText+'%'
    );

END
