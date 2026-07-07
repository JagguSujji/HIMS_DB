CREATE     PROCEDURE [dbo].[USP_SystemSetting_Get]

AS
BEGIN


SELECT

SettingId,
SettingKey,
SettingValue

FROM SystemSetting;


END
