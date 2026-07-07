CREATE TABLE [dbo].[SystemConfiguration] (
    [ConfigId]    INT            NOT NULL,
    [ConfigKey]   VARCHAR (100)  NULL,
    [ConfigValue] NVARCHAR (200) NULL,
    PRIMARY KEY CLUSTERED ([ConfigId] ASC)
);

