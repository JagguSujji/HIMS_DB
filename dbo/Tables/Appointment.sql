CREATE TABLE [dbo].[Appointment] (
    [AppointmentId]       BIGINT         IDENTITY (1, 1) NOT NULL,
    [PatientId]           BIGINT         NULL,
    [DoctorId]            INT            NULL,
    [AppointmentDate]     DATETIME       NULL,
    [AppointmentStatusId] INT            NULL,
    [PriorityLevelId]     INT            NULL,
    [SlotId]              BIGINT         NULL,
    [BranchId]            BIGINT         NULL,
    [DepartmentId]        BIGINT         NULL,
    [AppointmentTypeId]   BIGINT         NULL,
    [AppointmentModeId]   BIGINT         NULL,
    [ReasonForVisit]      NVARCHAR (500) NULL,
    [BookedBy]            BIGINT         NULL,
    [BookedOn]            DATETIME2 (7)  DEFAULT (getdate()) NULL,
    [Remarks]             NVARCHAR (500) NULL,
    PRIMARY KEY CLUSTERED ([AppointmentId] ASC)
);

