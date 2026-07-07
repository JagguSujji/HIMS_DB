CREATE     PROCEDURE [dbo].[USP_Patient_GenerateUHID]


(
 @UHID VARCHAR(50) OUTPUT
)

AS
BEGIN


DECLARE @CurrentValue INT;



SELECT

@CurrentValue=CurrentValue+1

FROM dbo.NumberSeriesGenerator

WHERE ModuleName='PATIENT';



UPDATE dbo.NumberSeriesGenerator

SET

CurrentValue=@CurrentValue

WHERE ModuleName='PATIENT';



SET @UHID=

'PAT'

+

RIGHT

(
'000000'
+
CAST(@CurrentValue AS VARCHAR),
6
);



END
