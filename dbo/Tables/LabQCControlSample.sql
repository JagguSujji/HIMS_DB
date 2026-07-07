CREATE TABLE [dbo].[LabQCControlSample] (
    [QCControlSampleId] BIGINT          IDENTITY (1, 1) NOT NULL,
    [LabTestId]         BIGINT          NOT NULL,
    [ControlLevel]      NVARCHAR (30)   NOT NULL,
    [ExpectedValue]     DECIMAL (18, 4) NOT NULL,
    [ActualValue]       DECIMAL (18, 4) NULL,
    [Result]            NVARCHAR (30)   NULL,
    [InstrumentId]      BIGINT          NULL,
    [TestedOn]          DATETIME2 (7)   DEFAULT (sysdatetime()) NOT NULL,
    [TestedBy]          BIGINT          NULL,
    PRIMARY KEY CLUSTERED ([QCControlSampleId] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_QCControl_Test]
    ON [dbo].[LabQCControlSample]([LabTestId] ASC);

