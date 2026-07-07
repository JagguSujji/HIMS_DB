CREATE TABLE [dbo].[DoctorLeave] (
    [LeaveId]    BIGINT         IDENTITY (1, 1) NOT NULL,
    [DoctorId]   BIGINT         NOT NULL,
    [FromDate]   DATE           NOT NULL,
    [ToDate]     DATE           NOT NULL,
    [Reason]     NVARCHAR (500) NULL,
    [IsApproved] BIT            DEFAULT ((1)) NOT NULL,
    [CreatedBy]  BIGINT         NULL,
    [CreatedOn]  DATETIME2 (7)  DEFAULT (getdate()) NOT NULL,
    PRIMARY KEY CLUSTERED ([LeaveId] ASC),
    CONSTRAINT [FK_DoctorLeave_Provider] FOREIGN KEY ([DoctorId]) REFERENCES [dbo].[Provider] ([ProviderId])
);

