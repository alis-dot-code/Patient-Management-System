USE [PatientDB]
GO
/****** Object:  Table [dbo].[Patient_Details]    Script Date: 4/17/2023 9:46:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient_Details](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [nvarchar](50) NULL,
	[middle_name] [nvarchar](50) NULL,
	[last_name] [nvarchar](50) NULL,
	[dob] [date] NULL,
	[ssn] [nvarchar](15) NULL,
	[address] [nvarchar](max) NULL,
	[city] [nvarchar](80) NULL,
	[zip] [nvarchar](10) NULL,
	[state] [nvarchar](50) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
 CONSTRAINT [PK_Patient_Details] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient_Lab_Result]    Script Date: 4/17/2023 9:46:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient_Lab_Result](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[lab_visit_id] [int] NULL,
	[test_name] [nvarchar](50) NULL,
	[test_result] [nvarchar](50) NULL,
	[test_observation] [nvarchar](50) NULL,
	[attachments] [nvarchar](50) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
 CONSTRAINT [PK_Patient_Lab_Result] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient_Lab_Visit]    Script Date: 4/17/2023 9:46:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient_Lab_Visit](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[patient_id] [int] NULL,
	[lab_name] [nvarchar](50) NULL,
	[lab_test_request] [nvarchar](100) NULL,
	[result_date] [nvarchar](50) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
 CONSTRAINT [PK_Patient_Lab_Visit] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient_Medication]    Script Date: 4/17/2023 9:46:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient_Medication](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Patient_id] [int] NOT NULL,
	[visit_id] [int] NULL,
	[medicine_name] [nvarchar](50) NULL,
	[dosage] [nvarchar](50) NULL,
	[frequency] [nvarchar](50) NULL,
	[Prescribed_by] [nvarchar](50) NULL,
	[Prescription_date] [date] NULL,
	[Prescription_period] [nvarchar](50) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
 CONSTRAINT [PK_Patient_Medication] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient_Vaccination_Data]    Script Date: 4/17/2023 9:46:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient_Vaccination_Data](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[patient_id] [int] NULL,
	[vaccine_name] [nvarchar](50) NULL,
	[vaccine_date] [date] NULL,
	[vaccine_validity] [nvarchar](50) NULL,
	[administered_by] [nvarchar](50) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
 CONSTRAINT [PK_Patient_Vaccination_Data] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient_Visit_History]    Script Date: 4/17/2023 9:46:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient_Visit_History](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[patient_id] [int] NOT NULL,
	[visit_date] [datetime] NULL,
	[doctor_name] [nvarchar](50) NULL,
	[nurse_name_1] [nvarchar](50) NULL,
	[nurse_name_2] [nvarchar](50) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
 CONSTRAINT [PK_Patient_Visit_History] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Patient_Details] ON 
GO
INSERT [dbo].[Patient_Details] ([id], [first_name], [middle_name], [last_name], [dob], [ssn], [address], [city], [zip], [state], [created_at], [updated_at]) VALUES (1, N'Mike', N'', N'pence', CAST(N'1980-11-10' AS Date), N'1111-2222-3333', N'mike address', N'san ramon', N'99999', N'ca', CAST(N'2023-04-17T08:52:11.257' AS DateTime), CAST(N'2023-04-17T08:52:11.257' AS DateTime))
GO
INSERT [dbo].[Patient_Details] ([id], [first_name], [middle_name], [last_name], [dob], [ssn], [address], [city], [zip], [state], [created_at], [updated_at]) VALUES (2, N'Jackson', N'ray', N'kite', CAST(N'1975-10-10' AS Date), N'1212-2222-1111', N'jackson address', N'seattle', N'98888', N'wa', CAST(N'2023-04-17T08:52:11.257' AS DateTime), CAST(N'2023-04-17T08:52:11.257' AS DateTime))
GO
INSERT [dbo].[Patient_Details] ([id], [first_name], [middle_name], [last_name], [dob], [ssn], [address], [city], [zip], [state], [created_at], [updated_at]) VALUES (3, N'thuaan', NULL, N'bui', CAST(N'1985-04-04' AS Date), N'1222-2222-2222', N'thuaan address', N'new york', N'98777', N'ny', CAST(N'2023-04-17T08:55:36.367' AS DateTime), CAST(N'2023-04-17T08:55:36.367' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Patient_Details] OFF
GO
SET IDENTITY_INSERT [dbo].[Patient_Lab_Result] ON 
GO
INSERT [dbo].[Patient_Lab_Result] ([id], [lab_visit_id], [test_name], [test_result], [test_observation], [attachments], [created_at], [updated_at]) VALUES (1, 1, N'pathology', N'healthy', N'result is normal', NULL, CAST(N'2023-04-17T08:55:36.367' AS DateTime), CAST(N'2023-04-17T08:55:36.367' AS DateTime))
GO
INSERT [dbo].[Patient_Lab_Result] ([id], [lab_visit_id], [test_name], [test_result], [test_observation], [attachments], [created_at], [updated_at]) VALUES (2, 2, N'radiation', N'need attention', N'parameters are above normal', NULL, CAST(N'2023-04-17T08:58:12.387' AS DateTime), CAST(N'2023-04-17T08:58:12.387' AS DateTime))
GO
INSERT [dbo].[Patient_Lab_Result] ([id], [lab_visit_id], [test_name], [test_result], [test_observation], [attachments], [created_at], [updated_at]) VALUES (3, 3, N'x-ray', N'wrist fracture', N'wrist displaced from bone', NULL, CAST(N'2023-04-17T09:09:52.190' AS DateTime), CAST(N'2023-04-17T09:09:52.190' AS DateTime))
GO
INSERT [dbo].[Patient_Lab_Result] ([id], [lab_visit_id], [test_name], [test_result], [test_observation], [attachments], [created_at], [updated_at]) VALUES (4, 4, N'ct-scan', N'small clot', N'small blood clot in brain', NULL, CAST(N'2023-04-17T09:09:52.190' AS DateTime), CAST(N'2023-04-17T09:09:52.190' AS DateTime))
GO
INSERT [dbo].[Patient_Lab_Result] ([id], [lab_visit_id], [test_name], [test_result], [test_observation], [attachments], [created_at], [updated_at]) VALUES (5, 5, N'x-ray', N'normal', N'hand bones got ', NULL, CAST(N'2023-04-17T09:13:17.803' AS DateTime), CAST(N'2023-04-17T09:13:17.803' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Patient_Lab_Result] OFF
GO
SET IDENTITY_INSERT [dbo].[Patient_Lab_Visit] ON 
GO
INSERT [dbo].[Patient_Lab_Visit] ([id], [patient_id], [lab_name], [lab_test_request], [result_date], [created_at], [updated_at]) VALUES (1, 1, N'ca lab', N'pathology', N'2-2-2009', CAST(N'2023-04-17T08:58:12.387' AS DateTime), CAST(N'2023-04-17T08:58:12.387' AS DateTime))
GO
INSERT [dbo].[Patient_Lab_Visit] ([id], [patient_id], [lab_name], [lab_test_request], [result_date], [created_at], [updated_at]) VALUES (2, 1, N'ca lab', N'radiology', N'3-5-2015', CAST(N'2023-04-17T09:03:52.527' AS DateTime), CAST(N'2023-04-17T09:03:52.527' AS DateTime))
GO
INSERT [dbo].[Patient_Lab_Visit] ([id], [patient_id], [lab_name], [lab_test_request], [result_date], [created_at], [updated_at]) VALUES (3, 2, N'wa labs', N'x-ray', N'9-9-2020', CAST(N'2023-04-17T09:13:17.803' AS DateTime), CAST(N'2023-04-17T09:13:17.803' AS DateTime))
GO
INSERT [dbo].[Patient_Lab_Visit] ([id], [patient_id], [lab_name], [lab_test_request], [result_date], [created_at], [updated_at]) VALUES (4, 2, N'wa labs', N'x-ray', N'2-2-2021', CAST(N'2023-04-17T09:15:49.220' AS DateTime), CAST(N'2023-04-17T09:15:49.220' AS DateTime))
GO
INSERT [dbo].[Patient_Lab_Visit] ([id], [patient_id], [lab_name], [lab_test_request], [result_date], [created_at], [updated_at]) VALUES (5, 3, N'ny labs', N'ct-scan', N'5-9-2022', CAST(N'2023-04-17T09:17:00.520' AS DateTime), CAST(N'2023-04-17T09:17:00.520' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Patient_Lab_Visit] OFF
GO
SET IDENTITY_INSERT [dbo].[Patient_Medication] ON 
GO
INSERT [dbo].[Patient_Medication] ([id], [Patient_id], [visit_id], [medicine_name], [dosage], [frequency], [Prescribed_by], [Prescription_date], [Prescription_period], [created_at], [updated_at]) VALUES (1, 1, 1, N'telenol', N'2', N'per day', N'doctor1', CAST(N'2009-02-03' AS Date), N'daily morning and night after dine', CAST(N'2023-04-17T09:19:25.743' AS DateTime), CAST(N'2023-04-17T09:19:25.743' AS DateTime))
GO
INSERT [dbo].[Patient_Medication] ([id], [Patient_id], [visit_id], [medicine_name], [dosage], [frequency], [Prescribed_by], [Prescription_date], [Prescription_period], [created_at], [updated_at]) VALUES (2, 1, 2, N'paracetamol', N'1', N'every 4 hours', N'doctor2', CAST(N'2015-03-06' AS Date), N'take after food', CAST(N'2023-04-17T09:19:25.743' AS DateTime), CAST(N'2023-04-17T09:19:25.743' AS DateTime))
GO
INSERT [dbo].[Patient_Medication] ([id], [Patient_id], [visit_id], [medicine_name], [dosage], [frequency], [Prescribed_by], [Prescription_date], [Prescription_period], [created_at], [updated_at]) VALUES (3, 2, 3, N'brufin', N'2', N'per day', N'doctor2', CAST(N'2020-09-10' AS Date), N'daily two morning and evening', CAST(N'2023-04-17T09:24:12.700' AS DateTime), CAST(N'2023-04-17T09:24:12.700' AS DateTime))
GO
INSERT [dbo].[Patient_Medication] ([id], [Patient_id], [visit_id], [medicine_name], [dosage], [frequency], [Prescribed_by], [Prescription_date], [Prescription_period], [created_at], [updated_at]) VALUES (4, 3, 5, N'medic2', N'2', N'per day', N'doctor5', CAST(N'2022-05-10' AS Date), N'daily twice before food', CAST(N'2023-04-17T09:24:12.700' AS DateTime), CAST(N'2023-04-17T09:24:12.700' AS DateTime))
GO
INSERT [dbo].[Patient_Medication] ([id], [Patient_id], [visit_id], [medicine_name], [dosage], [frequency], [Prescribed_by], [Prescription_date], [Prescription_period], [created_at], [updated_at]) VALUES (5, 2, 4, N'calcium', N'1', N'per week', N'doctor2', CAST(N'2021-02-03' AS Date), N'one per week any time', CAST(N'2023-04-17T09:27:41.107' AS DateTime), CAST(N'2023-04-17T09:27:41.107' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Patient_Medication] OFF
GO
SET IDENTITY_INSERT [dbo].[Patient_Vaccination_Data] ON 
GO
INSERT [dbo].[Patient_Vaccination_Data] ([id], [patient_id], [vaccine_name], [vaccine_date], [vaccine_validity], [administered_by], [created_at], [updated_at]) VALUES (1, 1, N'miesels', CAST(N'1985-11-10' AS Date), N'1990-11-10', N'NurseA', CAST(N'2023-04-17T09:30:39.980' AS DateTime), CAST(N'2023-04-17T09:30:39.980' AS DateTime))
GO
INSERT [dbo].[Patient_Vaccination_Data] ([id], [patient_id], [vaccine_name], [vaccine_date], [vaccine_validity], [administered_by], [created_at], [updated_at]) VALUES (2, 2, N'miesels', CAST(N'1980-10-10' AS Date), N'1985-10-10', N'NurseM', CAST(N'2023-04-17T09:31:48.137' AS DateTime), CAST(N'2023-04-17T09:31:48.137' AS DateTime))
GO
INSERT [dbo].[Patient_Vaccination_Data] ([id], [patient_id], [vaccine_name], [vaccine_date], [vaccine_validity], [administered_by], [created_at], [updated_at]) VALUES (3, 3, N'miesels', CAST(N'1990-04-04' AS Date), N'1995-04-04', N'NurseA', CAST(N'2023-04-17T09:32:23.997' AS DateTime), CAST(N'2023-04-17T09:32:23.997' AS DateTime))
GO
INSERT [dbo].[Patient_Vaccination_Data] ([id], [patient_id], [vaccine_name], [vaccine_date], [vaccine_validity], [administered_by], [created_at], [updated_at]) VALUES (4, 3, N'Rota', CAST(N'1986-04-04' AS Date), N'2016-04-04', N'NurseB', CAST(N'2023-04-17T09:32:23.997' AS DateTime), CAST(N'2023-04-17T09:32:23.997' AS DateTime))
GO
INSERT [dbo].[Patient_Vaccination_Data] ([id], [patient_id], [vaccine_name], [vaccine_date], [vaccine_validity], [administered_by], [created_at], [updated_at]) VALUES (5, 1, N'covid', CAST(N'2022-11-10' AS Date), N'2027-11-10', N'NurseL', CAST(N'2023-04-17T09:34:28.713' AS DateTime), CAST(N'2023-04-17T09:34:28.713' AS DateTime))
GO
INSERT [dbo].[Patient_Vaccination_Data] ([id], [patient_id], [vaccine_name], [vaccine_date], [vaccine_validity], [administered_by], [created_at], [updated_at]) VALUES (6, 2, N'covid', CAST(N'2022-01-02' AS Date), N'2027-01-02', N'NurseL', CAST(N'2023-04-17T09:35:11.807' AS DateTime), CAST(N'2023-04-17T09:35:11.807' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Patient_Vaccination_Data] OFF
GO
SET IDENTITY_INSERT [dbo].[Patient_Visit_History] ON 
GO
INSERT [dbo].[Patient_Visit_History] ([id], [patient_id], [visit_date], [doctor_name], [nurse_name_1], [nurse_name_2], [created_at], [updated_at]) VALUES (1, 1, CAST(N'2009-02-03T00:00:00.000' AS DateTime), N'doctor1', N'NurseA', N'NurseD', CAST(N'2023-04-17T09:35:11.807' AS DateTime), CAST(N'2023-04-17T09:35:11.807' AS DateTime))
GO
INSERT [dbo].[Patient_Visit_History] ([id], [patient_id], [visit_date], [doctor_name], [nurse_name_1], [nurse_name_2], [created_at], [updated_at]) VALUES (2, 1, CAST(N'2015-03-06T00:00:00.000' AS DateTime), N'doctor2', N'NurseD', N'NurseM', CAST(N'2023-04-17T09:37:59.443' AS DateTime), CAST(N'2023-04-17T09:37:59.443' AS DateTime))
GO
INSERT [dbo].[Patient_Visit_History] ([id], [patient_id], [visit_date], [doctor_name], [nurse_name_1], [nurse_name_2], [created_at], [updated_at]) VALUES (3, 2, CAST(N'2020-09-10T00:00:00.000' AS DateTime), N'doctor2', N'NurseD', N'NurseL', CAST(N'2023-04-17T09:38:52.160' AS DateTime), CAST(N'2023-04-17T09:38:52.160' AS DateTime))
GO
INSERT [dbo].[Patient_Visit_History] ([id], [patient_id], [visit_date], [doctor_name], [nurse_name_1], [nurse_name_2], [created_at], [updated_at]) VALUES (4, 3, CAST(N'2022-05-10T00:00:00.000' AS DateTime), N'doctor5', N'NurseA', N'NurseD', CAST(N'2023-04-17T09:39:37.837' AS DateTime), CAST(N'2023-04-17T09:39:37.837' AS DateTime))
GO
INSERT [dbo].[Patient_Visit_History] ([id], [patient_id], [visit_date], [doctor_name], [nurse_name_1], [nurse_name_2], [created_at], [updated_at]) VALUES (5, 2, CAST(N'2021-02-03T00:00:00.000' AS DateTime), N'doctor2', N'NurseL', N'NurseM', CAST(N'2023-04-17T09:40:19.910' AS DateTime), CAST(N'2023-04-17T09:40:19.910' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Patient_Visit_History] OFF
GO