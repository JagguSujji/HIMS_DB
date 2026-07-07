CREATE TABLE [dbo].[RolePermission] (
    [RolePermissionId] BIGINT        IDENTITY (1, 1) NOT NULL,
    [RoleId]           INT           NOT NULL,
    [PermissionId]     INT           NOT NULL,
    [CanView]          BIT           DEFAULT ((0)) NOT NULL,
    [CanCreate]        BIT           DEFAULT ((0)) NOT NULL,
    [CanEdit]          BIT           DEFAULT ((0)) NOT NULL,
    [CanDelete]        BIT           DEFAULT ((0)) NOT NULL,
    [CanApprove]       BIT           DEFAULT ((0)) NOT NULL,
    [CanPrint]         BIT           DEFAULT ((0)) NOT NULL,
    [CanExport]        BIT           DEFAULT ((0)) NOT NULL,
    [CreatedOn]        DATETIME2 (7) DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([RolePermissionId] ASC),
    CONSTRAINT [FK_RolePermission_Permission] FOREIGN KEY ([PermissionId]) REFERENCES [dbo].[Permission] ([PermissionId]),
    CONSTRAINT [FK_RolePermission_Role] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[Role] ([RoleId]),
    CONSTRAINT [UQ_RolePermission] UNIQUE NONCLUSTERED ([RoleId] ASC, [PermissionId] ASC)
);

