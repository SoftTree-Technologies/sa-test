CREATE TABLE [dbo].[region](
	[region_no] [dbo].[numeric_id] IDENTITY(1,1) NOT NULL,
	[region_name] [dbo].[shortstring] NOT NULL,
	[street] [dbo].[shortstring] NOT NULL,
	[city] [dbo].[shortstring] NOT NULL,
	[state_prov] [dbo].[statecode] NOT NULL,
	[country] [dbo].[countrycode] NOT NULL,
	[mail_code] [dbo].[mailcode] NOT NULL,
	[phone_no] [dbo].[phonenumber] NOT NULL,
	[region_code] [dbo].[status_code] NOT NULL,
 CONSTRAINT [region_ident] PRIMARY KEY CLUSTERED 
(
	[region_no] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[region] ADD  CONSTRAINT [region_status_default]  DEFAULT ('  ') FOR [region_code]
GO

