CREATE     PROCEDURE [dbo].[USP_LabTest_Get]

AS
BEGIN


SELECT


LT.LabTestId,

LT.TestCode,

LT.TestName,

TC.TestCategoryName,

LS.LabSectionName,

RU.UnitName


FROM dbo.LabTest LT


LEFT JOIN dbo.TestCategory TC

ON LT.TestCategoryId=TC.TestCategoryId


LEFT JOIN dbo.LabSection LS

ON LT.LabSectionId=LS.LabSectionId


LEFT JOIN dbo.ResultUnit RU

ON LT.ResultUnitId=RU.ResultUnitId;


END
