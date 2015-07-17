CREATE TABLE [dbo].[charge](
	[charge_no] [dbo].[numeric_id] IDENTITY(1,1) NOT NULL,
	[member_no] [dbo].[numeric_id] NOT NULL,
	[provider_no] [dbo].[numeric_id] NOT NULL,
	[category_no] [dbo].[numeric_id] NOT NULL,
	[charge_dt] [datetime] NOT NULL,
	[charge_amt] [money] NOT NULL,
	[statement_no] [dbo].[numeric_id] NOT NULL,
	[charge_code] [dbo].[status_code] NOT NULL,
 CONSTRAINT [ChargePK] PRIMARY KEY CLUSTERED 
(
	[charge_no] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


CREATE NONCLUSTERED INDEX [charge_category_link] ON [dbo].[charge] 
(
	[category_no] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO


CREATE NONCLUSTERED INDEX [charge_provider_link] ON [dbo].[charge] 
(
	[provider_no] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO


CREATE NONCLUSTERED INDEX [charge_statement_link] ON [dbo].[charge] 
(
	[statement_no] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO

ALTER TABLE [dbo].[charge]  WITH CHECK ADD  CONSTRAINT [charge_category_link] FOREIGN KEY([category_no])
REFERENCES [dbo].[category] ([category_no])
GO

ALTER TABLE [dbo].[charge] CHECK CONSTRAINT [charge_category_link]
GO

ALTER TABLE [dbo].[charge]  WITH CHECK ADD  CONSTRAINT [charge_member_link] FOREIGN KEY([member_no])
REFERENCES [dbo].[member] ([member_no])
GO

ALTER TABLE [dbo].[charge] CHECK CONSTRAINT [charge_member_link]
GO

ALTER TABLE [dbo].[charge]  WITH CHECK ADD  CONSTRAINT [charge_provider_link] FOREIGN KEY([provider_no])
REFERENCES [dbo].[provider] ([provider_no])
GO

ALTER TABLE [dbo].[charge] CHECK CONSTRAINT [charge_provider_link]
GO

ALTER TABLE [dbo].[charge] ADD  CONSTRAINT [charge_statement_no_default]  DEFAULT (0) FOR [statement_no]
GO

ALTER TABLE [dbo].[charge] ADD  CONSTRAINT [charge_status_default]  DEFAULT ('  ') FOR [charge_code]
GO

