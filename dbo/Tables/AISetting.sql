CREATE TABLE [dbo].[AISetting] (
    [AISettingId]  INT            IDENTITY (1, 1) NOT NULL,
    [SettingKey]   VARCHAR (100)  NULL,
    [SettingValue] NVARCHAR (MAX) NULL,
    [Description]  NVARCHAR (500) NULL,
    PRIMARY KEY CLUSTERED ([AISettingId] ASC)
);

