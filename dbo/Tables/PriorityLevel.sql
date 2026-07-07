CREATE TABLE [dbo].[PriorityLevel] (
    [PriorityLevelId] INT            IDENTITY (1, 1) NOT NULL,
    [PriorityCode]    VARCHAR (20)   NULL,
    [PriorityName]    NVARCHAR (100) NULL,
    [DisplayOrder]    INT            NULL,
    [DisplayColor]    VARCHAR (20)   NULL,
    [IsActive]        BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([PriorityLevelId] ASC)
);

