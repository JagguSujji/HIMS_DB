CREATE TABLE [dbo].[AttendanceStatus] (
    [AttendanceStatusId] INT            IDENTITY (1, 1) NOT NULL,
    [StatusCode]         VARCHAR (20)   NULL,
    [StatusName]         NVARCHAR (100) NULL,
    [IsActive]           BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([AttendanceStatusId] ASC),
    UNIQUE NONCLUSTERED ([StatusCode] ASC)
);

