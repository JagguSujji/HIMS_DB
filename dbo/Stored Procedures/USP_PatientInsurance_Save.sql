CREATE     PROCEDURE [dbo].[USP_PatientInsurance_Save]


(
 @PatientId BIGINT,

 @InsuranceProviderId BIGINT,

 @PolicyNumber VARCHAR(100)

)

AS
BEGIN


INSERT INTO dbo.PatientInsurance

(
PatientId,
InsuranceProviderId,
PolicyNumber
)


VALUES

(
@PatientId,
@InsuranceProviderId,
@PolicyNumber
);



END
