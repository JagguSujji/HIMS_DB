CREATE     PROCEDURE [dbo].[USP_RadiologyProcedure_Get]

(
 @ImagingTypeId BIGINT=NULL
)

AS
BEGIN


SELECT


RP.RadiologyProcedureId,
RP.ProcedureCode,
RP.ProcedureName,
IT.ImagingName,
BP.BodyPartName,
RP.EstimatedDuration


FROM dbo.RadiologyProcedure RP


INNER JOIN dbo.ImagingType IT

ON RP.ImagingTypeId=IT.ImagingTypeId


INNER JOIN dbo.BodyPart BP

ON RP.BodyPartId=BP.BodyPartId


WHERE RP.IsActive=1


AND

(
@ImagingTypeId IS NULL

OR RP.ImagingTypeId=@ImagingTypeId
);



END
