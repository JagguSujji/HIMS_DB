


--------------------------------------------------------------
-- 10. Get Radiology Report Templates
--------------------------------------------------------------

CREATE     PROCEDURE [dbo].[USP_RadiologyReportTemplate_Get]
(
    @ImagingTypeId INT = NULL
)
AS
BEGIN


    SELECT

        ReportTemplateId,
        TemplateCode,
        TemplateName,
        ImagingTypeId,
        BodyPartId,
        TemplateText

    FROM dbo.RadiologyReportTemplate

    WHERE IsActive=1

    AND
    (
        @ImagingTypeId IS NULL
        OR ImagingTypeId=@ImagingTypeId
    )

    ORDER BY TemplateName;


END
