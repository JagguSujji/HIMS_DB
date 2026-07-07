CREATE TABLE [dbo].[LoginAudit] (
    [LoginAuditId]    BIGINT         IDENTITY (1, 1) NOT NULL,
    [UserId]          INT            NULL,
    [Username]        VARCHAR (100)  NULL,
    [LoginDateTime]   DATETIME2 (7)  NOT NULL,
    [IsSuccessful]    BIT            NOT NULL,
    [FailureReason]   NVARCHAR (300) NULL,
    [IPAddress]       VARCHAR (100)  NULL,
    [BrowserName]     NVARCHAR (200) NULL,
    [OperatingSystem] NVARCHAR (200) NULL,
    [DeviceName]      NVARCHAR (200) NULL,
    [CreatedOn]       DATETIME2 (7)  DEFAULT (getdate()) NULL,
    PRIMARY KEY CLUSTERED ([LoginAuditId] ASC),
    CONSTRAINT [FK_LoginAudit_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[ApplicationUser] ([UserId])
);

