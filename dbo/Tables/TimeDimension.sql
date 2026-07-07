CREATE TABLE [dbo].[TimeDimension] (
    [TimeDimensionId] INT            IDENTITY (1, 1) NOT NULL,
    [TimeCode]        VARCHAR (20)   NULL,
    [TimeName]        NVARCHAR (100) NULL,
    [DisplayOrder]    INT            NULL,
    [IsActive]        BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([TimeDimensionId] ASC)
);

