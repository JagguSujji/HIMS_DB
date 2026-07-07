-- ============================================================================
-- HIMS VitalSignsRecording Table - NEW FOR CLINICAL WORKFLOW
-- ============================================================================
-- Purpose: Record vital signs (BP, HR, Temperature, SpO2, etc.) at patient encounters
-- This is critical for patient monitoring and clinical decision-making
-- ============================================================================

CREATE TABLE [dbo].[VitalSignsRecording] (
    -- PRIMARY KEY
    [VitalSignsRecordingId]     BIGINT         IDENTITY (1, 1) NOT NULL,
    
    -- FOREIGN KEYS
    [PatientId]                 BIGINT         NOT NULL,                   -- Which patient
    [EncounterId]               BIGINT         NULL,                       -- Associated encounter
    [AdmissionId]               BIGINT         NULL,                       -- If inpatient
    [VisitId]                   BIGINT         NULL,                       -- Associated visit
    [RecordedBy]                BIGINT         NOT NULL,                   -- Who recorded (nurse/doctor)
    
    -- RECORDING DETAILS
    [RecordingDateTime]         DATETIME2(7)   NOT NULL,                   -- When recorded
    [RecordingDeviceType]       VARCHAR (50)   NULL,                       -- Manual, Digital, Automated
    [DeviceSerialNumber]        VARCHAR (100)  NULL,                       -- Device used
    
    -- VITAL SIGNS - CARDIOVASCULAR
    [BloodPressureSystolic]     INT            NULL,                       -- mmHg
    [BloodPressureDiastolic]    INT            NULL,                       -- mmHg
    [BloodPressureArm]          VARCHAR (20)   NULL,                       -- Left/Right
    [PulseRate]                 INT            NULL,                       -- Beats per minute
    [PulseRegularity]           VARCHAR (20)   NULL,                       -- Regular/Irregular
    [PulseQuality]              VARCHAR (50)   NULL,                       -- Weak/Normal/Bounding
    
    -- VITAL SIGNS - RESPIRATORY
    [RespiratoryRate]           INT            NULL,                       -- Breaths per minute
    [RespiratoryDepth]          VARCHAR (20)   NULL,                       -- Shallow/Normal/Deep
    [RespirationPattern]        VARCHAR (50)   NULL,                       -- Regular/Labored/Wheezing
    [OxygenSaturation]          DECIMAL(5, 2)  NULL,                       -- SpO2 %
    [OxygenSaturationUnit]      VARCHAR (10)   DEFAULT 'SaO2',
    [OxygenDeliveryMethod]      VARCHAR (50)   NULL,                       -- RA/O2 therapy/Mask
    
    -- VITAL SIGNS - THERMAL
    [BodyTemperature]           DECIMAL(5, 2)  NULL,                       -- Celsius or Fahrenheit
    [TemperatureUnit]           VARCHAR (10)   DEFAULT 'C',                -- C or F
    [TemperatureSite]           VARCHAR (50)   NULL,                       -- Oral/Axillary/Rectal/Tympanic
    
    -- VITAL SIGNS - METABOLIC
    [BloodGlucose]              DECIMAL(7, 2)  NULL,                       -- mg/dL
    [BloodGlucoseUnit]          VARCHAR (20)   DEFAULT 'mg/dL',
    [BloodGlucoseReadingType]   VARCHAR (20)   NULL,                       -- Fasting/Random/PostPrandial
    
    -- VITAL SIGNS - OTHER
    [Weight]                    DECIMAL(7, 2)  NULL,                       -- kg
    [Height]                    DECIMAL(6, 2)  NULL,                       -- cm
    [BMI]                       DECIMAL(5, 2)  NULL,                       -- Calculated
    [PainScore]                 INT            NULL,                       -- 0-10 scale
    [PainLocation]              VARCHAR (200)  NULL,                       -- Where pain
    [ConsciousnessLevel]        VARCHAR (50)   NULL,                       -- Alert/Drowsy/Unconscious
    [GlasgowComaScale]          INT            NULL,                       -- GCS score (3-15)
    
    -- CLINICAL ASSESSMENT
    [Findings]                  NVARCHAR (MAX) NULL,                       -- Clinical findings
    [Abnormalities]             NVARCHAR (MAX) NULL,                       -- Any abnormal findings
    [ActionTaken]               NVARCHAR (MAX) NULL,                       -- Action taken based on vitals
    [NursingNotes]              NVARCHAR (MAX) NULL,                       -- Nursing observations
    
    -- ALERTS & FLAGS
    [IsAbnormal]                BIT            NOT NULL DEFAULT 0,         -- Any value abnormal
    [IsCritical]                BIT            NOT NULL DEFAULT 0,         -- Critical value alert
    [CriticalAlert]             NVARCHAR (200) NULL,                       -- Which value is critical
    [NotifiedTo]                BIGINT         NULL,                       -- Doctor notified
    [NotificationDateTime]      DATETIME2(7)   NULL,                       -- When notified
    
    -- STATUS
    [IsActive]                  BIT            NOT NULL DEFAULT 1,
    [IsDeleted]                 BIT            NOT NULL DEFAULT 0,
    [IsModified]                BIT            NOT NULL DEFAULT 0,         -- Has been edited
    
    -- AUDIT
    [CreatedBy]                 BIGINT         NOT NULL,
    [CreatedOn]                 DATETIME2(7)   NOT NULL DEFAULT GETDATE(),
    [ModifiedBy]                BIGINT         NULL,
    [ModifiedOn]                DATETIME2(7)   NULL,
    [RowVersion]                ROWVERSION     NOT NULL,
    
    -- CONSTRAINTS
    PRIMARY KEY CLUSTERED ([VitalSignsRecordingId] ASC),
    
    CONSTRAINT [FK_VitalSignsRecording_Patient]
        FOREIGN KEY ([PatientId]) REFERENCES [dbo].[Patient] ([PatientId]),
    CONSTRAINT [FK_VitalSignsRecording_Encounter]
        FOREIGN KEY ([EncounterId]) REFERENCES [dbo].[Encounter] ([EncounterId]),
    CONSTRAINT [FK_VitalSignsRecording_Admission]
        FOREIGN KEY ([AdmissionId]) REFERENCES [dbo].[Admission] ([AdmissionId]),
    CONSTRAINT [FK_VitalSignsRecording_Visit]
        FOREIGN KEY ([VisitId]) REFERENCES [dbo].[Visit] ([VisitId]),
    CONSTRAINT [FK_VitalSignsRecording_RecordedBy]
        FOREIGN KEY ([RecordedBy]) REFERENCES [dbo].[Employee] ([EmployeeId]),
    CONSTRAINT [FK_VitalSignsRecording_NotifiedTo]
        FOREIGN KEY ([NotifiedTo]) REFERENCES [dbo].[Employee] ([EmployeeId]),
    CONSTRAINT [FK_VitalSignsRecording_CreatedBy]
        FOREIGN KEY ([CreatedBy]) REFERENCES [dbo].[ApplicationUser] ([UserId]),
    CONSTRAINT [FK_VitalSignsRecording_ModifiedBy]
        FOREIGN KEY ([ModifiedBy]) REFERENCES [dbo].[ApplicationUser] ([UserId]),
    
    -- CHECK CONSTRAINTS
    CONSTRAINT [CK_VitalSignsRecording_DateTime]
        CHECK ([RecordingDateTime] <= GETDATE()),
    CONSTRAINT [CK_VitalSignsRecording_BloodPressure]
        CHECK ([BloodPressureSystolic] IS NULL OR ([BloodPressureSystolic] > 0 AND [BloodPressureSystolic] < 300)),
    CONSTRAINT [CK_VitalSignsRecording_PulseRate]
        CHECK ([PulseRate] IS NULL OR ([PulseRate] > 0 AND [PulseRate] < 300)),
    CONSTRAINT [CK_VitalSignsRecording_RespiratoryRate]
        CHECK ([RespiratoryRate] IS NULL OR ([RespiratoryRate] > 0 AND [RespiratoryRate] < 100)),
    CONSTRAINT [CK_VitalSignsRecording_SpO2]
        CHECK ([OxygenSaturation] IS NULL OR ([OxygenSaturation] > 0 AND [OxygenSaturation] <= 100)),
    CONSTRAINT [CK_VitalSignsRecording_Temperature]
        CHECK ([BodyTemperature] IS NULL OR ([BodyTemperature] > 30 AND [BodyTemperature] < 45)),
    CONSTRAINT [CK_VitalSignsRecording_PainScore]
        CHECK ([PainScore] IS NULL OR ([PainScore] >= 0 AND [PainScore] <= 10)),
    CONSTRAINT [CK_VitalSignsRecording_GCS]
        CHECK ([GlasgowComaScale] IS NULL OR ([GlasgowComaScale] >= 3 AND [GlasgowComaScale] <= 15)),
    CONSTRAINT [CK_VitalSignsRecording_CriticalLogic]
        CHECK ([IsCritical] = 0 OR [CriticalAlert] IS NOT NULL),
    CONSTRAINT [CK_VitalSignsRecording_NotificationLogic]
        CHECK ([NotifiedTo] IS NULL OR [NotificationDateTime] IS NOT NULL)
);

-- CREATE INDEXES
CREATE NONCLUSTERED INDEX [IX_VitalSignsRecording_PatientId]
    ON [dbo].[VitalSignsRecording]([PatientId])
    WHERE [IsDeleted] = 0;

CREATE NONCLUSTERED INDEX [IX_VitalSignsRecording_RecordingDateTime]
    ON [dbo].[VitalSignsRecording]([RecordingDateTime] DESC)
    WHERE [IsDeleted] = 0;

CREATE NONCLUSTERED INDEX [IX_VitalSignsRecording_EncounterId]
    ON [dbo].[VitalSignsRecording]([EncounterId])
    WHERE [IsDeleted] = 0;

CREATE NONCLUSTERED INDEX [IX_VitalSignsRecording_AdmissionId]
    ON [dbo].[VitalSignsRecording]([AdmissionId])
    WHERE [IsDeleted] = 0;

CREATE NONCLUSTERED INDEX [IX_VitalSignsRecording_RecordedBy]
    ON [dbo].[VitalSignsRecording]([RecordedBy])
    WHERE [IsDeleted] = 0;

-- Filtered index for critical values
CREATE NONCLUSTERED INDEX [IX_VitalSignsRecording_Critical]
    ON [dbo].[VitalSignsRecording]([PatientId], [RecordingDateTime])
    WHERE [IsDeleted] = 0 AND [IsCritical] = 1;

-- Filtered index for abnormal values
CREATE NONCLUSTERED INDEX [IX_VitalSignsRecording_Abnormal]
    ON [dbo].[VitalSignsRecording]([PatientId], [RecordingDateTime])
    WHERE [IsDeleted] = 0 AND [IsAbnormal] = 1;

-- ============================================================================
-- CHANGE SUMMARY
-- ============================================================================
-- NEW TABLE - Records vital signs at patient encounters/admissions
-- FIELDS: Cardiovascular (BP, HR, pulse quality)
-- FIELDS: Respiratory (RR, SpO2, breathing pattern)
-- FIELDS: Thermal (body temperature at different sites)
-- FIELDS: Metabolic (blood glucose)
-- FIELDS: Neurological (consciousness level, GCS)
-- FIELDS: Anthropometric (weight, height, BMI)
-- FIELDS: Pain assessment (score and location)
-- FIELDS: Critical value tracking and doctor notification
-- FIELDS: Clinical findings and action taken
-- INDEXES: Patient, Encounter, Admission lookups
-- INDEXES: Critical values, abnormal values for alerts
-- ============================================================================
