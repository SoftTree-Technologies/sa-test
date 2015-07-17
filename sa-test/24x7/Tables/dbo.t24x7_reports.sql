CREATE TABLE [dbo].[t24x7_reports](
	[ReportId] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Header] [nvarchar](255) NULL,
	[Description] [nvarchar](2000) NULL,
	[ModifiedBy] [nvarchar](128) NULL,
	[ModifiedTime] [datetime] NULL,
	[SQLQuery] [nvarchar](max) NOT NULL,
	[EmailRecipients] [nvarchar](255) NULL,
	[OutputFormat] [char](3) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ReportId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

