CREATE TABLE [dbo].[ICUSeverityScore] (
    [ScoreId]        BIGINT        IDENTITY (1, 1) NOT NULL,
    [ICUAdmissionId] BIGINT        NOT NULL,
    [ScoreType]      NVARCHAR (50) NOT NULL,
    [ScoreValue]     INT           NOT NULL,
    [RiskLevel]      NVARCHAR (30) NULL,
    [CalculatedOn]   DATETIME2 (7) DEFAULT (sysdatetime()) NOT NULL,
    PRIMARY KEY CLUSTERED ([ScoreId] ASC)
);

