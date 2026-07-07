

CREATE     PROCEDURE [dbo].[USP_AISetting_Save]
(
 @SettingKey VARCHAR(100),
 @SettingValue VARCHAR(500),
 @Description VARCHAR(500)
)
AS
BEGIN

INSERT INTO AISetting
(
 SettingKey,
 SettingValue,
 Description
)
VALUES
(
 @SettingKey,
 @SettingValue,
 @Description
)

END
