CREATE TABLE [dbo].[SystemSetting] (
    [SettingId]    INT            IDENTITY (1, 1) NOT NULL,
    [SettingKey]   VARCHAR (100)  NULL,
    [SettingValue] NVARCHAR (MAX) NULL,
    PRIMARY KEY CLUSTERED ([SettingId] ASC)
);

