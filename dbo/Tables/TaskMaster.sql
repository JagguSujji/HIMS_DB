CREATE TABLE [dbo].[TaskMaster] (
    [TaskId]          BIGINT         IDENTITY (1, 1) NOT NULL,
    [TaskNumber]      NVARCHAR (30)  NOT NULL,
    [ModuleName]      NVARCHAR (100) NOT NULL,
    [RecordId]        BIGINT         NOT NULL,
    [TaskTitle]       NVARCHAR (250) NOT NULL,
    [TaskDescription] NVARCHAR (MAX) NULL,
    [PriorityLevelId] BIGINT         NULL,
    [StatusId]        BIGINT         NOT NULL,
    [DueDate]         DATETIME2 (7)  NULL,
    [CompletedOn]     DATETIME2 (7)  NULL,
    [IsRecurring]     BIT            CONSTRAINT [DF_TaskMaster_IsRecurring] DEFAULT ((0)) NOT NULL,
    [IsActive]        BIT            CONSTRAINT [DF_TaskMaster_IsActive] DEFAULT ((1)) NOT NULL,
    [IsDeleted]       BIT            CONSTRAINT [DF_TaskMaster_IsDeleted] DEFAULT ((0)) NOT NULL,
    [CreatedBy]       BIGINT         NOT NULL,
    [CreatedOn]       DATETIME2 (7)  CONSTRAINT [DF_TaskMaster_CreatedOn] DEFAULT (sysdatetime()) NOT NULL,
    [ModifiedBy]      BIGINT         NULL,
    [ModifiedOn]      DATETIME2 (7)  NULL,
    [DeletedBy]       BIGINT         NULL,
    [DeletedOn]       DATETIME2 (7)  NULL,
    [RowVersion]      ROWVERSION     NOT NULL,
    PRIMARY KEY CLUSTERED ([TaskId] ASC),
    CONSTRAINT [UQ_TaskMaster_TaskNumber] UNIQUE NONCLUSTERED ([TaskNumber] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_TaskMaster_Module_Record]
    ON [dbo].[TaskMaster]([ModuleName] ASC, [RecordId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_TaskMaster_Status]
    ON [dbo].[TaskMaster]([StatusId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_TaskMaster_Priority]
    ON [dbo].[TaskMaster]([PriorityLevelId] ASC);

