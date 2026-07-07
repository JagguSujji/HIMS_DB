CREATE TABLE [dbo].[UserRole] (
    [UserRoleId]    BIGINT        IDENTITY (1, 1) NOT NULL,
    [UserId]        INT           NOT NULL,
    [RoleId]        INT           NOT NULL,
    [BranchId]      INT           NULL,
    [EffectiveFrom] DATE          NOT NULL,
    [EffectiveTo]   DATE          NULL,
    [IsActive]      BIT           DEFAULT ((1)) NOT NULL,
    [CreatedBy]     INT           NULL,
    [CreatedOn]     DATETIME2 (7) DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([UserRoleId] ASC),
    CONSTRAINT [FK_UserRole_Branch] FOREIGN KEY ([BranchId]) REFERENCES [dbo].[Branch] ([BranchId]),
    CONSTRAINT [FK_UserRole_Role] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[Role] ([RoleId]),
    CONSTRAINT [FK_UserRole_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[ApplicationUser] ([UserId])
);

