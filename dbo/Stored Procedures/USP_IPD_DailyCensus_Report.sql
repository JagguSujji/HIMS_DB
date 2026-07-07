CREATE     PROCEDURE [dbo].[USP_IPD_DailyCensus_Report]
(
 @Date DATE=NULL
)
AS
BEGIN

SET NOCOUNT ON;


IF @Date IS NULL
SET @Date=CAST(GETDATE() AS DATE);


SELECT

COUNT(*) TotalPatients

FROM dbo.Admission

WHERE
CAST(AdmissionDate AS DATE)<=@Date

AND
(
DischargeDate IS NULL
OR
CAST(DischargeDate AS DATE)>=@Date
);


END
