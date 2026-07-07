CREATE TABLE [dbo].[InsurancePolicy] (
    [PolicyId]            BIGINT          IDENTITY (1, 1) NOT NULL,
    [PatientId]           BIGINT          NOT NULL,
    [InsuranceProviderId] BIGINT          NOT NULL,
    [PolicyNumber]        NVARCHAR (100)  NOT NULL,
    [CoverageAmount]      DECIMAL (18, 2) NULL,
    [ValidFrom]           DATE            NULL,
    [ValidTo]             DATE            NULL,
    [Status]              NVARCHAR (30)   DEFAULT ('ACTIVE') NOT NULL,
    PRIMARY KEY CLUSTERED ([PolicyId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_Policy_Patient]
    ON [dbo].[InsurancePolicy]([PatientId] ASC);

