CREATE TABLE [dbo].[StatusMaster] (
    [StatusId]   INT            IDENTITY (1, 1) NOT NULL,
    [StatusCode] NVARCHAR (50)  NULL,
    [StatusName] NVARCHAR (100) NULL,
    [ModuleName] NVARCHAR (100) NULL,
    [IsActive]   BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([StatusId] ASC)
);

