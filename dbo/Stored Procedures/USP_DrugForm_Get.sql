CREATE     PROCEDURE [dbo].[USP_DrugForm_Get]

AS
BEGIN


SELECT

DrugFormId,
DrugFormCode,
DrugFormName


FROM dbo.DrugForm


WHERE IsActive=1;


END
