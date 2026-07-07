CREATE     PROCEDURE [dbo].[USP_LabTest_Master_GetAll]


AS
BEGIN


SELECT


LabTestId,

TestCode,

TestName,

TestCategoryId


FROM LabTest


WHERE IsActive=1;



END
