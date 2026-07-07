CREATE TABLE [dbo].[AIModelRoutingRule] (
    [RuleId]   INT NOT NULL,
    [IntentId] INT NULL,
    [ModelId]  INT NULL,
    [Priority] INT NULL,
    PRIMARY KEY CLUSTERED ([RuleId] ASC)
);

