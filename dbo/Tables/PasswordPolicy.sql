CREATE TABLE [dbo].[PasswordPolicy] (
    [PasswordPolicyId]   INT IDENTITY (1, 1) NOT NULL,
    [MinLength]          INT NULL,
    [MaxLength]          INT NULL,
    [RequireSpecialChar] BIT NULL,
    [RequireNumber]      BIT NULL,
    [RequireUpperCase]   BIT NULL,
    [ExpiryDays]         INT NULL,
    PRIMARY KEY CLUSTERED ([PasswordPolicyId] ASC)
);

