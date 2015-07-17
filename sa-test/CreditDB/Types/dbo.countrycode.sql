CREATE TYPE [dbo].[countrycode] FROM [char](2) NOT NULL
GO

GRANT REFERENCES ON TYPE::[dbo].[countrycode] TO [public] AS [dbo]
GO

