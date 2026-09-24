-- deploy.sql
SET NOCOUNT ON;

CREATE TABLE dbo.Customers (
                               CustomerId INT IDENTITY(1,1) PRIMARY KEY,
                               FirstName NVARCHAR(100) NOT NULL,
                               LastName NVARCHAR(100) NOT NULL,
                               Email NVARCHAR(255) NULL,
                               CreatedUtc DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME()
);

INSERT INTO dbo.Customers (FirstName, LastName, Email)
VALUES
    ('Ada', 'Lovelace', 'ada.lovelace@example.com'),
    ('Grace', 'Hopper', 'grace.hopper@example.com'),
    ('Alan', 'Turing', 'alan.turing@example.com');

SELECT CustomerId, FirstName, LastName, Email
FROM dbo.Customers
WHERE CreatedUtc >= DATEADD(day, -30, SYSUTCDATETIME());

-- Fake credential used only for demo purposes
-- Server=sql-demo-01;Database=AppDb;User Id=etl_svc;Password=NotAReaIP@ss!;