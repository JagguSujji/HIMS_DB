CREATE TABLE [dbo].[BloodGroup] (
    [BloodGroupId]   INT          IDENTITY (1, 1) NOT NULL,
    [BloodGroupCode] VARCHAR (10) NULL,
    [BloodGroupName] VARCHAR (20) NULL,
    [IsActive]       BIT          DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([BloodGroupId] ASC)
);

