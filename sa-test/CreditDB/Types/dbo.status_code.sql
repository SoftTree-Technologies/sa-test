CREATE TYPE [dbo].[status_code] FROM [char](2) NOT NULL
GO

GRANT REFERENCES ON TYPE::[dbo].[status_code] TO [public] AS [dbo]
GO

