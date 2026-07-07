CREATE     PROCEDURE [dbo].[USP_Patient_Vitals_History]


(
 @PatientId BIGINT

)

AS
BEGIN


SELECT


VS.RecordedOn,

VT.VitalName,

VS.Value,

U.UnitName


FROM dbo.VitalSigns VS


INNER JOIN dbo.VitalType VT

ON VS.VitalTypeId=VT.VitalTypeId


LEFT JOIN dbo.UnitOfMeasure U

ON VS.UnitOfMeasureId=U.UnitOfMeasureId



WHERE

VS.PatientId=@PatientId



ORDER BY

VS.RecordedOn DESC;


END
