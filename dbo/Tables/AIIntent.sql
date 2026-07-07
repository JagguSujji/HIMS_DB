CREATE TABLE [dbo].[AIIntent] (
    [IntentId]    INT            IDENTITY (1, 1) NOT NULL,
    [IntentCode]  VARCHAR (30)   NULL,
    [IntentName]  NVARCHAR (200) NULL,
    [Description] NVARCHAR (500) NULL,
    [IsActive]    BIT            NULL,
    PRIMARY KEY CLUSTERED ([IntentId] ASC)
);

