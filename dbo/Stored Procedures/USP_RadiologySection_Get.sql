


--------------------------------------------------------------
-- 12. Radiology Section Master
--------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_RadiologySection_Get]
AS
BEGIN


    SELECT

        RadiologySectionId,
        SectionCode,
        SectionName

    FROM dbo.RadiologySection

    WHERE IsActive=1

    ORDER BY SectionName;


END
