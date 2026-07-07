


/*******************************************************
 14. Body Part Master
*******************************************************/
CREATE     PROCEDURE [dbo].[USP_BodyPart_GetAll]
AS
BEGIN

    SELECT
        BodyPartId,
        BodyPartCode,
        BodyPartName,
        ParentBodyPartId
    FROM dbo.BodyPart
    WHERE IsActive=1;

END
