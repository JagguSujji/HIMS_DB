CREATE TABLE [dbo].[AttendanceType] (
    [AttendanceTypeId]   INT            IDENTITY (1, 1) NOT NULL,
    [AttendanceTypeCode] VARCHAR (20)   NULL,
    [AttendanceTypeName] NVARCHAR (100) NULL,
    [IsPresent]          BIT            NULL,
    [IsPaid]             BIT            NULL,
    [IsActive]           BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([AttendanceTypeId] ASC)
);

