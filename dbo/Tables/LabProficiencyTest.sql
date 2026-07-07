CREATE TABLE [dbo].[LabProficiencyTest] (
    [ProficiencyTestId] BIGINT         IDENTITY (1, 1) NOT NULL,
    [LabTestId]         BIGINT         NOT NULL,
    [ProviderName]      NVARCHAR (150) NOT NULL,
    [ExpectedResult]    NVARCHAR (100) NULL,
    [ObservedResult]    NVARCHAR (100) NULL,
    [Score]             DECIMAL (5, 2) NULL,
    [Status]            NVARCHAR (30)  NOT NULL,
    [ConductedOn]       DATETIME2 (7)  DEFAULT (sysdatetime()) NOT NULL,
    PRIMARY KEY CLUSTERED ([ProficiencyTestId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_Proficiency_Test]
    ON [dbo].[LabProficiencyTest]([LabTestId] ASC);

