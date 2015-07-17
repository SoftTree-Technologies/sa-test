CREATE TABLE [dbo].[member](
	[member_no] [dbo].[numeric_id] IDENTITY(1,1) NOT NULL,
	[lastname] [dbo].[shortstring] NOT NULL,
	[firstname] [dbo].[shortstring] NOT NULL,
	[middleinitial] [dbo].[letter] NULL,
	[street] [dbo].[shortstring] NOT NULL,
	[city] [dbo].[shortstring] NOT NULL,
	[state_prov] [dbo].[statecode] NOT NULL,
	[country] [dbo].[countrycode] NOT NULL,
	[mail_code] [dbo].[mailcode] NOT NULL,
	[phone_no] [dbo].[phonenumber] NULL,
	[photograph] [image] NULL,
	[issue_dt] [datetime] NOT NULL,
	[expr_dt] [datetime] NOT NULL,
	[region_no] [dbo].[numeric_id] NOT NULL,
	[corp_no] [dbo].[numeric_id] NULL,
	[prev_balance] [money] NULL,
	[curr_balance] [money] NULL,
	[member_code] [dbo].[status_code] NOT NULL,
 CONSTRAINT [member_ident] PRIMARY KEY CLUSTERED 
(
	[member_no] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO


CREATE NONCLUSTERED INDEX [member_corporation_link] ON [dbo].[member] 
(
	[corp_no] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO


CREATE NONCLUSTERED INDEX [member_region_link] ON [dbo].[member] 
(
	[region_no] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO

ALTER TABLE [dbo].[member]  WITH CHECK ADD  CONSTRAINT [member_corporation_link] FOREIGN KEY([corp_no])
REFERENCES [dbo].[corporation] ([corp_no])
GO

ALTER TABLE [dbo].[member] CHECK CONSTRAINT [member_corporation_link]
GO

ALTER TABLE [dbo].[member]  WITH CHECK ADD  CONSTRAINT [member_region_link] FOREIGN KEY([region_no])
REFERENCES [dbo].[region] ([region_no])
GO

ALTER TABLE [dbo].[member] CHECK CONSTRAINT [member_region_link]
GO

ALTER TABLE [dbo].[member] ADD  CONSTRAINT [member_issue_dt_default]  DEFAULT (getdate()) FOR [issue_dt]
GO

ALTER TABLE [dbo].[member] ADD  CONSTRAINT [member_expr_dt_default]  DEFAULT (dateadd(year,1,getdate())) FOR [expr_dt]
GO

ALTER TABLE [dbo].[member] ADD  CONSTRAINT [member_prev_balance_default]  DEFAULT (0) FOR [prev_balance]
GO

ALTER TABLE [dbo].[member] ADD  CONSTRAINT [member_curr_balance_default]  DEFAULT (0) FOR [curr_balance]
GO

ALTER TABLE [dbo].[member] ADD  CONSTRAINT [member_status_default]  DEFAULT ('  ') FOR [member_code]
GO

