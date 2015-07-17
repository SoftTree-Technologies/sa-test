CREATE TABLE [dbo].[category](
	[category_no] [dbo].[numeric_id] IDENTITY(1,1) NOT NULL,
	[category_desc] [dbo].[normstring] NOT NULL,
	[category_code] [dbo].[status_code] NOT NULL,
 CONSTRAINT [category_ident] PRIMARY KEY CLUSTERED 
(
	[category_no] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[category] ADD  CONSTRAINT [category_status_default]  DEFAULT ('  ') FOR [category_code]
GO

