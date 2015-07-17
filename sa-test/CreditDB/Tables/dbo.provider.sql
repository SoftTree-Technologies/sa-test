CREATE TABLE [dbo].[provider](
	[provider_no] [dbo].[numeric_id] IDENTITY(1,1) NOT NULL,
	[provider_name] [dbo].[shortstring] NOT NULL,
	[street] [dbo].[shortstring] NOT NULL,
	[city] [dbo].[shortstring] NOT NULL,
	[state_prov] [dbo].[statecode] NOT NULL,
	[mail_code] [dbo].[mailcode] NOT NULL,
	[country] [dbo].[countrycode] NOT NULL,
	[phone_no] [dbo].[phonenumber] NOT NULL,
	[issue_dt] [datetime] NOT NULL,
	[expr_dt] [datetime] NOT NULL,
	[region_no] [dbo].[numeric_id] NOT NULL,
	[provider_code] [dbo].[status_code] NOT NULL,
 CONSTRAINT [provider_ident] PRIMARY KEY CLUSTERED 
(
	[provider_no] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


CREATE NONCLUSTERED INDEX [provider_region_link] ON [dbo].[provider] 
(
	[region_no] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO

ALTER TABLE [dbo].[provider]  WITH CHECK ADD  CONSTRAINT [provider_region_link] FOREIGN KEY([region_no])
REFERENCES [dbo].[region] ([region_no])
GO

ALTER TABLE [dbo].[provider] CHECK CONSTRAINT [provider_region_link]
GO

ALTER TABLE [dbo].[provider] ADD  CONSTRAINT [provider_issue_dt_default]  DEFAULT (getdate()) FOR [issue_dt]
GO

ALTER TABLE [dbo].[provider] ADD  CONSTRAINT [provider_expr_dt_default]  DEFAULT (dateadd(year,1,getdate())) FOR [expr_dt]
GO

ALTER TABLE [dbo].[provider] ADD  CONSTRAINT [provider_status_default]  DEFAULT ('  ') FOR [provider_code]
GO

