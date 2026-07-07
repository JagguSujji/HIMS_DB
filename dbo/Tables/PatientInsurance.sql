CREATE TABLE [dbo].[PatientInsurance] (
    [PatientInsuranceId]  BIGINT        IDENTITY (1, 1) NOT NULL,
    [PatientId]           BIGINT        NULL,
    [InsuranceProviderId] INT           NULL,
    [PolicyNumber]        VARCHAR (100) NULL,
    [PolicyId]            INT           NULL,
    PRIMARY KEY CLUSTERED ([PatientInsuranceId] ASC)
);

