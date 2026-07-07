CREATE TABLE [dbo].[AmbulanceStatus] (
    [AmbulanceStatusId] INT            IDENTITY (1, 1) NOT NULL,
    [StatusCode]        VARCHAR (20)   NULL,
    [StatusName]        NVARCHAR (100) NULL,
    [DisplayColor]      VARCHAR (20)   NULL,
    [IsActive]          BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([AmbulanceStatusId] ASC)
);

