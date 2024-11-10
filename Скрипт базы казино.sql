USE [Casino]
GO
/****** Object:  Table [dbo].[Bets]    Script Date: 10.11.2024 16:09:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bets](
	[BetID] [int] IDENTITY(1,1) NOT NULL,
	[SessionID] [int] NOT NULL,
	[BetAmount] [decimal](18, 2) NOT NULL,
	[Result] [nvarchar](50) NOT NULL,
	[WinAmount] [int] NULL,
 CONSTRAINT [PK_Bets] PRIMARY KEY CLUSTERED 
(
	[BetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Game]    Script Date: 10.11.2024 16:09:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Game](
	[GameID] [int] IDENTITY(1,1) NOT NULL,
	[GameName] [nvarchar](max) NOT NULL,
	[Descr] [nvarchar](max) NULL,
 CONSTRAINT [PK_Game] PRIMARY KEY CLUSTERED 
(
	[GameID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GameSessions]    Script Date: 10.11.2024 16:09:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GameSessions](
	[SessionID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[GameID] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[BetAmount] [decimal](18, 2) NULL,
	[WinAmount] [decimal](18, 2) NULL,
 CONSTRAINT [PK_GameSessions] PRIMARY KEY CLUSTERED 
(
	[SessionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Report]    Script Date: 10.11.2024 16:09:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report](
	[ID_Report] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[GameCount] [int] NULL,
	[Wins] [int] NULL,
	[Losses] [int] NULL,
	[AmountResult] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Report] PRIMARY KEY CLUSTERED 
(
	[ID_Report] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 10.11.2024 16:09:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 10.11.2024 16:09:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[TransactionID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[TransactionType] [nchar](10) NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Transactions] PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 10.11.2024 16:09:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](max) NOT NULL,
	[PassHash] [nvarchar](max) NOT NULL,
	[IsBanned] [bit] NOT NULL,
	[RegistrationDate] [date] NOT NULL,
	[Balance] [int] NOT NULL,
	[RoleID] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Game] ON 

INSERT [dbo].[Game] ([GameID], [GameName], [Descr]) VALUES (1, N'Crash', N'Raketka')
SET IDENTITY_INSERT [dbo].[Game] OFF
GO
SET IDENTITY_INSERT [dbo].[GameSessions] ON 

INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (1, 1, 1, CAST(N'2024-09-21T17:24:15.083' AS DateTime), CAST(111.00 AS Decimal(18, 2)), CAST(172.20 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (2, 1, 1, CAST(N'2024-09-21T17:25:50.410' AS DateTime), CAST(123.00 AS Decimal(18, 2)), CAST(904.40 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (3, 1, 1, CAST(N'2024-09-21T17:26:10.933' AS DateTime), CAST(100.00 AS Decimal(18, 2)), CAST(448.94 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (4, 1, 1, CAST(N'2024-09-21T17:26:56.610' AS DateTime), CAST(182.00 AS Decimal(18, 2)), CAST(49.43 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (5, 1, 1, CAST(N'2024-09-21T17:43:31.570' AS DateTime), CAST(111.00 AS Decimal(18, 2)), CAST(-11.00 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (6, 1, 1, CAST(N'2024-09-21T17:46:28.760' AS DateTime), CAST(123.00 AS Decimal(18, 2)), CAST(196.80 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (7, 1, 1, CAST(N'2024-09-21T17:46:53.710' AS DateTime), CAST(532.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (8, 1, 1, CAST(N'2024-09-21T17:49:24.733' AS DateTime), CAST(123.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (9, 1, 1, CAST(N'2024-09-21T17:50:27.720' AS DateTime), CAST(12.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (10, 1, 1, CAST(N'2024-09-21T17:52:37.287' AS DateTime), CAST(11.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (11, 1, 1, CAST(N'2024-09-21T19:07:27.707' AS DateTime), CAST(123.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (12, 2, 1, CAST(N'2024-09-21T19:15:13.227' AS DateTime), CAST(1000.00 AS Decimal(18, 2)), CAST(1530.00 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (13, 2, 1, CAST(N'2024-09-21T19:15:26.223' AS DateTime), CAST(10.00 AS Decimal(18, 2)), CAST(-10.00 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (14, 3, 1, CAST(N'2024-09-28T14:43:11.693' AS DateTime), CAST(150.00 AS Decimal(18, 2)), CAST(283.50 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (15, 3, 1, CAST(N'2024-09-28T14:43:53.173' AS DateTime), CAST(34.00 AS Decimal(18, 2)), CAST(-34.00 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (16, 3, 1, CAST(N'2024-09-28T14:45:55.940' AS DateTime), CAST(16.00 AS Decimal(18, 2)), CAST(-16.00 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (17, 3, 1, CAST(N'2024-09-28T14:47:06.560' AS DateTime), CAST(34.00 AS Decimal(18, 2)), CAST(-50.00 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (18, 3, 1, CAST(N'2024-09-28T14:49:25.030' AS DateTime), CAST(50.00 AS Decimal(18, 2)), CAST(152.00 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (19, 3, 1, CAST(N'2024-09-28T15:06:41.260' AS DateTime), CAST(100.00 AS Decimal(18, 2)), CAST(-52.00 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (20, 3, 1, CAST(N'2024-09-28T15:16:32.157' AS DateTime), CAST(52.00 AS Decimal(18, 2)), CAST(168.00 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (21, 3, 1, CAST(N'2024-09-28T15:23:48.423' AS DateTime), CAST(100.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (22, 3, 1, CAST(N'2024-09-28T15:28:18.323' AS DateTime), CAST(100.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (23, 3, 1, CAST(N'2024-09-28T15:30:24.423' AS DateTime), CAST(100.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (24, 3, 1, CAST(N'2024-09-28T15:35:09.353' AS DateTime), CAST(100.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (25, 3, 1, CAST(N'2024-09-28T15:38:13.567' AS DateTime), CAST(100.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (26, 3, 1, CAST(N'2024-09-28T15:38:33.697' AS DateTime), CAST(2.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (27, 3, 1, CAST(N'2024-09-28T15:40:59.700' AS DateTime), CAST(12.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (28, 3, 1, CAST(N'2024-09-28T15:42:15.220' AS DateTime), CAST(10.00 AS Decimal(18, 2)), CAST(0.00 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (29, 3, 1, CAST(N'2024-09-28T15:44:14.593' AS DateTime), CAST(5.00 AS Decimal(18, 2)), CAST(6.50 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (30, 3, 1, CAST(N'2024-09-28T15:59:50.277' AS DateTime), CAST(100.00 AS Decimal(18, 2)), CAST(208.00 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (31, 3, 1, CAST(N'2024-09-28T16:02:52.307' AS DateTime), CAST(2.00 AS Decimal(18, 2)), CAST(2.52 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (32, 3, 1, CAST(N'2024-09-28T16:02:57.913' AS DateTime), CAST(1.00 AS Decimal(18, 2)), CAST(1.13 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (33, 3, 1, CAST(N'2024-09-28T16:03:13.183' AS DateTime), CAST(1.00 AS Decimal(18, 2)), CAST(1.18 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (34, 3, 1, CAST(N'2024-09-28T16:03:25.073' AS DateTime), CAST(1.00 AS Decimal(18, 2)), CAST(1.15 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (35, 3, 1, CAST(N'2024-09-28T16:03:26.070' AS DateTime), CAST(1.00 AS Decimal(18, 2)), CAST(1.45 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (36, 3, 1, CAST(N'2024-09-28T16:03:41.093' AS DateTime), CAST(1.00 AS Decimal(18, 2)), CAST(1.16 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (37, 3, 1, CAST(N'2024-09-28T16:09:18.140' AS DateTime), CAST(100.00 AS Decimal(18, 2)), CAST(15.00 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (38, 3, 1, CAST(N'2024-09-28T16:09:26.993' AS DateTime), CAST(100.00 AS Decimal(18, 2)), CAST(26.00 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (39, 3, 1, CAST(N'2024-09-28T16:11:34.720' AS DateTime), CAST(100.00 AS Decimal(18, 2)), CAST(131.00 AS Decimal(18, 2)))
INSERT [dbo].[GameSessions] ([SessionID], [UserID], [GameID], [Date], [BetAmount], [WinAmount]) VALUES (40, 3, 1, CAST(N'2024-11-10T16:03:05.587' AS DateTime), CAST(98.00 AS Decimal(18, 2)), CAST(-98.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[GameSessions] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [Name]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([RoleID], [Name]) VALUES (2, N'User')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Transactions] ON 

INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (1, 1, N'Пополнение', CAST(1111.00 AS Decimal(18, 2)), CAST(N'2024-09-21T17:23:03.617' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (2, 1, N'Выигрыш   ', CAST(172.20 AS Decimal(18, 2)), CAST(N'2024-09-21T17:25:51.093' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (3, 1, N'Ставка    ', CAST(-182.00 AS Decimal(18, 2)), CAST(N'2024-09-21T17:27:09.117' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (4, 1, N'Ставка    ', CAST(-111.00 AS Decimal(18, 2)), CAST(N'2024-09-21T17:43:43.763' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (5, 1, N'Ставка    ', CAST(-123.00 AS Decimal(18, 2)), CAST(N'2024-09-21T17:46:39.727' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (6, 1, N'Выигрыш   ', CAST(904.40 AS Decimal(18, 2)), CAST(N'2024-09-21T17:46:54.947' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (7, 1, N'Выигрыш   ', CAST(448.94 AS Decimal(18, 2)), CAST(N'2024-09-21T17:49:29.320' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (8, 1, N'Выигрыш   ', CAST(49.43 AS Decimal(18, 2)), CAST(N'2024-09-21T17:50:38.750' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (9, 1, N'Ставка    ', CAST(-11.00 AS Decimal(18, 2)), CAST(N'2024-09-21T17:52:44.347' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (10, 1, N'Вывод     ', CAST(3333.00 AS Decimal(18, 2)), CAST(N'2024-09-21T17:54:48.520' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (11, 1, N'Пополнение', CAST(1231231.00 AS Decimal(18, 2)), CAST(N'2024-09-21T17:59:13.680' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (12, 1, N'Выигрыш   ', CAST(196.80 AS Decimal(18, 2)), CAST(N'2024-09-21T19:07:29.997' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (13, 2, N'Пополнение', CAST(123111.00 AS Decimal(18, 2)), CAST(N'2024-09-21T19:14:48.400' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (14, 2, N'Вывод     ', CAST(123.00 AS Decimal(18, 2)), CAST(N'2024-09-21T19:15:02.730' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (15, 2, N'Выигрыш   ', CAST(1530.00 AS Decimal(18, 2)), CAST(N'2024-09-21T19:15:15.300' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (16, 2, N'Ставка    ', CAST(-10.00 AS Decimal(18, 2)), CAST(N'2024-09-21T19:15:35.493' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (17, 3, N'Пополнение', CAST(5000.00 AS Decimal(18, 2)), CAST(N'2024-09-28T14:43:00.227' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (18, 3, N'Выигрыш   ', CAST(283.50 AS Decimal(18, 2)), CAST(N'2024-09-28T14:43:14.793' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (19, 3, N'Вывод     ', CAST(5100.00 AS Decimal(18, 2)), CAST(N'2024-09-28T14:43:48.610' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (20, 3, N'Ставка    ', CAST(-34.00 AS Decimal(18, 2)), CAST(N'2024-09-28T14:44:06.523' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (21, 3, N'Пополнение', CAST(50.00 AS Decimal(18, 2)), CAST(N'2024-09-28T14:45:51.640' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (22, 3, N'Ставка    ', CAST(-16.00 AS Decimal(18, 2)), CAST(N'2024-09-28T14:46:11.900' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (23, 3, N'Пополнение', CAST(50.00 AS Decimal(18, 2)), CAST(N'2024-09-28T14:47:00.683' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (24, 3, N'Пополнение', CAST(50.00 AS Decimal(18, 2)), CAST(N'2024-09-28T14:49:20.387' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (25, 3, N'Ставка    ', CAST(-50.00 AS Decimal(18, 2)), CAST(N'2024-09-28T14:49:40.037' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (26, 3, N'Пополнение', CAST(100.00 AS Decimal(18, 2)), CAST(N'2024-09-28T15:06:36.217' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (27, 3, N'Выигрыш   ', CAST(152.00 AS Decimal(18, 2)), CAST(N'2024-09-28T15:06:43.067' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (28, 3, N'Ставка    ', CAST(-52.00 AS Decimal(18, 2)), CAST(N'2024-09-28T15:16:55.863' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (29, 3, N'Выигрыш   ', CAST(168.00 AS Decimal(18, 2)), CAST(N'2024-09-28T15:23:50.763' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (30, 3, N'Выигрыш   ', CAST(121.00 AS Decimal(18, 2)), CAST(N'2024-09-28T15:38:14.363' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (31, 3, N'Выигрыш   ', CAST(2.80 AS Decimal(18, 2)), CAST(N'2024-09-28T15:38:35.017' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (32, 3, N'Выигрыш   ', CAST(14.76 AS Decimal(18, 2)), CAST(N'2024-09-28T15:41:01.747' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (33, 3, N'Выигрыш   ', CAST(12.00 AS Decimal(18, 2)), CAST(N'2024-09-28T15:42:17.113' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (34, 3, N'Выигрыш   ', CAST(6.50 AS Decimal(18, 2)), CAST(N'2024-09-28T15:44:17.337' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (35, 3, N'Выигрыш   ', CAST(208.00 AS Decimal(18, 2)), CAST(N'2024-09-28T15:59:54.120' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (36, 3, N'Выигрыш   ', CAST(2.52 AS Decimal(18, 2)), CAST(N'2024-09-28T16:02:53.307' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (37, 3, N'Выигрыш   ', CAST(1.13 AS Decimal(18, 2)), CAST(N'2024-09-28T16:02:58.373' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (38, 3, N'Выигрыш   ', CAST(1.18 AS Decimal(18, 2)), CAST(N'2024-09-28T16:03:13.807' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (39, 3, N'Выигрыш   ', CAST(1.15 AS Decimal(18, 2)), CAST(N'2024-09-28T16:03:25.597' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (40, 3, N'Выигрыш   ', CAST(1.45 AS Decimal(18, 2)), CAST(N'2024-09-28T16:03:27.647' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (41, 3, N'Выигрыш   ', CAST(1.16 AS Decimal(18, 2)), CAST(N'2024-09-28T16:03:41.667' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (42, 3, N'Выигрыш   ', CAST(15.00 AS Decimal(18, 2)), CAST(N'2024-09-28T16:09:18.853' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (43, 3, N'Выигрыш   ', CAST(26.00 AS Decimal(18, 2)), CAST(N'2024-09-28T16:09:27.887' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (44, 3, N'Выигрыш   ', CAST(31.00 AS Decimal(18, 2)), CAST(N'2024-09-28T16:11:36.000' AS DateTime))
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [TransactionType], [Amount], [TransactionDate]) VALUES (45, 3, N'Ставка    ', CAST(-98.00 AS Decimal(18, 2)), CAST(N'2024-11-10T16:03:08.113' AS DateTime))
SET IDENTITY_INSERT [dbo].[Transactions] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [Username], [PassHash], [IsBanned], [RegistrationDate], [Balance], [RoleID]) VALUES (0, N'qqq', N'pmWkWSBCL51Bfkhn79xPuKBKHz//H6B+mY6G9/eieuM=', 0, CAST(N'2024-09-20' AS Date), 11357, NULL)
INSERT [dbo].[User] ([UserID], [Username], [PassHash], [IsBanned], [RegistrationDate], [Balance], [RoleID]) VALUES (1, N'fen4', N'qVvBZjGuK2+ttFXuAY2grcJwPlbYnj7tB0zlbS97G2o=', 0, CAST(N'2024-09-21' AS Date), 1229217, NULL)
INSERT [dbo].[User] ([UserID], [Username], [PassHash], [IsBanned], [RegistrationDate], [Balance], [RoleID]) VALUES (2, N'Arseniy', N'SJzV28cIx+VB3k182Rzm0PFhNXO3/FtA05Qsy5VVzzU=', 0, CAST(N'2024-09-21' AS Date), 123498, NULL)
INSERT [dbo].[User] ([UserID], [Username], [PassHash], [IsBanned], [RegistrationDate], [Balance], [RoleID]) VALUES (3, N'user', N'fx8HPYu5suOtbIhQGWYNG1GzifjpFp69FVhkZ/i8h+Y=', 0, CAST(N'2024-09-28' AS Date), 200, NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_Balance]  DEFAULT ((0)) FOR [Balance]
GO
ALTER TABLE [dbo].[Bets]  WITH CHECK ADD  CONSTRAINT [FK_Bets_GameSessions] FOREIGN KEY([SessionID])
REFERENCES [dbo].[GameSessions] ([SessionID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Bets] CHECK CONSTRAINT [FK_Bets_GameSessions]
GO
ALTER TABLE [dbo].[GameSessions]  WITH CHECK ADD  CONSTRAINT [FK_GameSessions_Game] FOREIGN KEY([GameID])
REFERENCES [dbo].[Game] ([GameID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GameSessions] CHECK CONSTRAINT [FK_GameSessions_Game]
GO
ALTER TABLE [dbo].[GameSessions]  WITH CHECK ADD  CONSTRAINT [FK_GameSessions_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GameSessions] CHECK CONSTRAINT [FK_GameSessions_User]
GO
ALTER TABLE [dbo].[Report]  WITH CHECK ADD  CONSTRAINT [FK_Report_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Report] CHECK CONSTRAINT [FK_Report_User]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_User]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
