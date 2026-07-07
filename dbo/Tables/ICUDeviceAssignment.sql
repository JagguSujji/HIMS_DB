CREATE TABLE [dbo].[ICUDeviceAssignment] (
    [DeviceAssignmentId] BIGINT         IDENTITY (1, 1) NOT NULL,
    [ICUAdmissionId]     BIGINT         NOT NULL,
    [DeviceType]         NVARCHAR (50)  NOT NULL,
    [DeviceId]           BIGINT         NULL,
    [StartTime]          DATETIME2 (7)  DEFAULT (sysdatetime()) NOT NULL,
    [EndTime]            DATETIME2 (7)  NULL,
    [Settings]           NVARCHAR (MAX) NULL,
    [Status]             NVARCHAR (30)  DEFAULT ('ACTIVE') NOT NULL,
    PRIMARY KEY CLUSTERED ([DeviceAssignmentId] ASC),
    CONSTRAINT [FK_ICUDevice_ICUAdmission] FOREIGN KEY ([ICUAdmissionId]) REFERENCES [dbo].[ICUAdmission] ([ICUAdmissionId])
);


GO
CREATE NONCLUSTERED INDEX [IX_ICUDevice_Admission]
    ON [dbo].[ICUDeviceAssignment]([ICUAdmissionId] ASC);

