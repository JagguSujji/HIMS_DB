CREATE TABLE [dbo].[LabTestPanel] (
    [LabTestPanelId] INT            IDENTITY (1, 1) NOT NULL,
    [PanelName]      NVARCHAR (200) NULL,
    [IsActive]       BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([LabTestPanelId] ASC)
);

