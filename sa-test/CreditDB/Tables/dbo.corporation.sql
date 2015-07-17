CREATE TABLE [dbo].[corporation](
	[corp_no] [dbo].[numeric_id] IDENTITY(1,1) NOT NULL,
	[corp_name] [dbo].[normstring] NOT NULL,
	[street] [dbo].[shortstring] NOT NULL,
	[city] [dbo].[shortstring] NOT NULL,
	[state_prov] [dbo].[statecode] NOT NULL,
	[country] [dbo].[countrycode] NOT NULL,
	[mail_code] [dbo].[mailcode] NOT NULL,
	[phone_no] [dbo].[phonenumber] NOT NULL,
	[expr_dt] [datetime] NOT NULL,
	[region_no] [dbo].[numeric_id] NOT NULL,
	[corp_code] [dbo].[status_code] NOT NULL,
 CONSTRAINT [corporation_ident] PRIMARY KEY CLUSTERED 
(
	[corp_no] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


CREATE NONCLUSTERED INDEX [corporation_region_link] ON [dbo].[corporation] 
(
	[region_no] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO

ALTER TABLE [dbo].[corporation]  WITH CHECK ADD  CONSTRAINT [corporation_region_link] FOREIGN KEY([region_no])
REFERENCES [dbo].[region] ([region_no])
GO

ALTER TABLE [dbo].[corporation] CHECK CONSTRAINT [corporation_region_link]
GO

ALTER TABLE [dbo].[corporation] ADD  CONSTRAINT [corporation_status_default]  DEFAULT ('  ') FOR [corp_code]
GO

