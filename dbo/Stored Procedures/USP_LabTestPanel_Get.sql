CREATE     PROCEDURE [dbo].[USP_LabTestPanel_Get]

AS
BEGIN


SELECT

LabTestPanelId,
PanelName


FROM dbo.LabTestPanel


WHERE IsActive=1;


END
