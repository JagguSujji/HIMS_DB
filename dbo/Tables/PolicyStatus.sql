CREATE TABLE [dbo].[PolicyStatus] (
    [PolicyStatusId] INT            IDENTITY (1, 1) NOT NULL,
    [StatusCode]     VARCHAR (20)   NULL,
    [StatusName]     NVARCHAR (100) NULL,
    [IsClosed]       BIT            NULL,
    [IsActive]       BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([PolicyStatusId] ASC)
);

