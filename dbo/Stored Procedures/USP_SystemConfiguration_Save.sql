CREATE     PROCEDURE [dbo].[USP_SystemConfiguration_Save]

(
 @ConfigKey VARCHAR(100),
 @ConfigValue NVARCHAR(MAX)
)

AS
BEGIN

IF EXISTS
(
 SELECT 1
 FROM SystemConfiguration
 WHERE ConfigKey=@ConfigKey
)

BEGIN

UPDATE SystemConfiguration

SET

ConfigValue=@ConfigValue

WHERE ConfigKey=@ConfigKey;


END

ELSE

BEGIN

INSERT INTO SystemConfiguration

(
ConfigKey,
ConfigValue
)

VALUES

(
@ConfigKey,
@ConfigValue
);


END


END
