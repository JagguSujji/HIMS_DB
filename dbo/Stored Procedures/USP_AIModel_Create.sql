/* ==========================================================
   MODULE 13 - AI PLATFORM / CLINICAL AI
   Missing Stored Procedures Only
==========================================================*/


/************************************************************
 AI MODEL MANAGEMENT
************************************************************/

CREATE     PROCEDURE [dbo].[USP_AIModel_Create]
(
    @ModelCode VARCHAR(50),
    @ModelName VARCHAR(200),
    @VendorName VARCHAR(100),
    @ModelType VARCHAR(50),
    @CurrentVersion VARCHAR(50)
)
AS
BEGIN
 INSERT INTO AIModel
 (
  ModelCode,
  ModelName,
  VendorName,
  ModelType,
  CurrentVersion,
  IsActive,
  CreatedOn
 )
 VALUES
 (
  @ModelCode,
  @ModelName,
  @VendorName,
  @ModelType,
  @CurrentVersion,
  1,
  GETDATE()
 )
END
