


/***********************************************************
 Create Tariff Plan
***********************************************************/
CREATE     PROCEDURE [dbo].[USP_TariffPlan_Create]
(
 @TariffPlanCode VARCHAR(50),
 @TariffPlanName VARCHAR(200),
 @InsuranceTypeId INT
)
AS
BEGIN


INSERT INTO TariffPlan
(
TariffPlanCode,
TariffPlanName,
InsuranceTypeId,
EffectiveFrom,
IsActive
)

VALUES
(
@TariffPlanCode,
@TariffPlanName,
@InsuranceTypeId,
GETDATE(),
1
)


END
