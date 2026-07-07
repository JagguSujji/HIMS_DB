


/*******************************************************
 15. Wound Classification Master
*******************************************************/
CREATE     PROCEDURE [dbo].[USP_WoundClassification_GetAll]
AS
BEGIN

    SELECT
        WoundClassificationId,
        ClassificationCode,
        ClassificationName

    FROM dbo.WoundClassification

    WHERE IsActive=1;

END
