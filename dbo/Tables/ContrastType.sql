CREATE TABLE [dbo].[ContrastType] (
    [ContrastTypeId] INT            IDENTITY (1, 1) NOT NULL,
    [ContrastCode]   VARCHAR (20)   NULL,
    [ContrastName]   NVARCHAR (100) NULL,
    [Description]    NVARCHAR (300) NULL,
    [IsActive]       BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([ContrastTypeId] ASC)
);

