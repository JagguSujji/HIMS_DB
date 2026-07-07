CREATE     PROCEDURE [dbo].[USP_NumberSeries_GetNext]


(
 @ModuleName VARCHAR(100)
)

AS
BEGIN


DECLARE 

@CurrentValue INT,

@Prefix VARCHAR(20),

@NewValue INT;



SELECT

@CurrentValue=CurrentValue,

@Prefix=Prefix

FROM NumberSeriesGenerator

WHERE ModuleName=@ModuleName;



SET @NewValue=@CurrentValue+1;



UPDATE NumberSeriesGenerator

SET

CurrentValue=@NewValue

WHERE ModuleName=@ModuleName;



SELECT

@Prefix+

RIGHT('000000'+CAST(@NewValue AS VARCHAR(10)),6)
AS GeneratedNumber;



END
