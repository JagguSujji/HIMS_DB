CREATE TABLE [dbo].[Gender] (
    [GenderId]     INT           IDENTITY (1, 1) NOT NULL,
    [GenderCode]   VARCHAR (10)  NOT NULL,
    [GenderName]   VARCHAR (50)  NOT NULL,
    [Description]  VARCHAR (200) NULL,
    [DisplayOrder] INT           DEFAULT ((1)) NOT NULL,
    [IsActive]     BIT           DEFAULT ((1)) NOT NULL,
    [CreatedOn]    DATETIME      DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY CLUSTERED ([GenderId] ASC)
);

