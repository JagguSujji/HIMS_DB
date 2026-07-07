



/***************************************************************
 PATIENT ANALYTICS
****************************************************************/


CREATE     PROCEDURE [dbo].[USP_Patient_Demographic_Report]
AS
BEGIN


SELECT

G.GenderName,

COUNT(P.PatientId) TotalPatients


FROM Patient P

LEFT JOIN Gender G
ON G.GenderId=P.GenderId


GROUP BY G.GenderName


END
