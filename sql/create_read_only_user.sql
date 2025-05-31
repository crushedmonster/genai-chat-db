-- Replace <YourUserName> and <YourStrongPasswordHere> with your chosen username and secure password
CREATE USER <YourUserName> WITH PASSWORD = '<YourStrongPasswordHere>';

-- Grant read-only access
EXEC sp_addrolemember 'db_datareader', '<YourUserName>';
