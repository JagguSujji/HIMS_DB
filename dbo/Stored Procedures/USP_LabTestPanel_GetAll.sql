


/*******************************************************
 3. Get Lab Test Panel
*******************************************************/
CREATE     PROCEDURE [dbo].[USP_LabTestPanel_GetAll]
AS
BEGIN

    SELECT
        LabTestPanelId,
        PanelName,
        IsActive
    FROM dbo.LabTestPanel
    WHERE IsActive=1;

END
