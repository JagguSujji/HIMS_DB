CREATE TABLE [dbo].[AssetAssignment] (
    [AssignmentId]     BIGINT         IDENTITY (1, 1) NOT NULL,
    [AssetId]          BIGINT         NOT NULL,
    [AssignedToUserId] BIGINT         NULL,
    [DepartmentId]     BIGINT         NULL,
    [LocationId]       BIGINT         NULL,
    [AssignedOn]       DATETIME2 (7)  CONSTRAINT [DF_AssetAssignment_On] DEFAULT (sysdatetime()) NOT NULL,
    [ReleasedOn]       DATETIME2 (7)  NULL,
    [Remarks]          NVARCHAR (500) NULL,
    PRIMARY KEY CLUSTERED ([AssignmentId] ASC),
    CONSTRAINT [FK_AssetAssignment_Asset] FOREIGN KEY ([AssetId]) REFERENCES [dbo].[Asset] ([AssetId])
);


GO
CREATE NONCLUSTERED INDEX [IX_AssetAssignment_Asset]
    ON [dbo].[AssetAssignment]([AssetId] ASC);

