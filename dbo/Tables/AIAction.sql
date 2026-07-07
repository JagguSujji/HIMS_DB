CREATE TABLE [dbo].[AIAction] (
    [AIActionId]           INT            IDENTITY (1, 1) NOT NULL,
    [ActionCode]           VARCHAR (30)   NULL,
    [ActionName]           NVARCHAR (100) NULL,
    [APIEndpoint]          NVARCHAR (300) NULL,
    [ModuleName]           VARCHAR (50)   NULL,
    [RequiresConfirmation] BIT            NULL,
    [IsActive]             BIT            NULL,
    PRIMARY KEY CLUSTERED ([AIActionId] ASC)
);

