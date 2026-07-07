CREATE TABLE [dbo].[Application] (
    [ApplicationId]   INT            IDENTITY (1, 1) NOT NULL,
    [ApplicationCode] VARCHAR (50)   NULL,
    [ApplicationName] NVARCHAR (200) NULL,
    [IsActive]        BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([ApplicationId] ASC)
);

