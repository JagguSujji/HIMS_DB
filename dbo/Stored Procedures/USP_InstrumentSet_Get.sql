CREATE     PROCEDURE [dbo].[USP_InstrumentSet_Get]


AS
BEGIN


SELECT

InstrumentSetId,
InstrumentSetCode,
InstrumentSetName,
SterilizationRequired


FROM dbo.InstrumentSet


WHERE IsActive=1;


END
