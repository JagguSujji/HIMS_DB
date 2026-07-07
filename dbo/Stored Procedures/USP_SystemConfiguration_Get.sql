CREATE     PROCEDURE [dbo].[USP_SystemConfiguration_Get]

(
 @ConfigKey VARCHAR(100)=NULL
)

AS
BEGIN

SELECT

ConfigId,
ConfigKey,
ConfigValue

FROM SystemConfiguration

WHERE

@ConfigKey IS NULL
OR ConfigKey=@ConfigKey;


END
