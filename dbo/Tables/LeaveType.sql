CREATE TABLE [dbo].[LeaveType] (
    [LeaveTypeId]         INT            IDENTITY (1, 1) NOT NULL,
    [LeaveCode]           VARCHAR (20)   NULL,
    [LeaveName]           NVARCHAR (100) NULL,
    [MaximumDays]         INT            NULL,
    [CarryForwardAllowed] BIT            DEFAULT ((0)) NULL,
    [MaximumCarryForward] INT            DEFAULT ((0)) NULL,
    [IsPaid]              BIT            DEFAULT ((1)) NULL,
    [AllowHalfDay]        BIT            DEFAULT ((0)) NULL,
    [RequiresApproval]    BIT            DEFAULT ((1)) NULL,
    [IsActive]            BIT            DEFAULT ((1)) NULL,
    [GenderId]            INT            NULL,
    PRIMARY KEY CLUSTERED ([LeaveTypeId] ASC),
    UNIQUE NONCLUSTERED ([LeaveCode] ASC)
);

