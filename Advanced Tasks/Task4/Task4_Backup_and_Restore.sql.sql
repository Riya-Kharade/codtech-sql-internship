-- Step 1: Backup the Database
-- MySQL Backup
-- Execute the following command in your terminal or command line:
-- mysqldump -u root -p Task4DB > task4db_backup.sql

-- PostgreSQL Backup
-- Execute the following command in your terminal or command line:
-- pg_dump -U postgres -F c -b -v -f task4db_backup.dump Task4DB

-- Step 2: Restore the Database
-- MySQL Restore
-- Execute the following command in your terminal or command line:
-- mysql -u root -p Task4DB < task4db_backup.sql

-- PostgreSQL Restore
-- Execute the following command in your terminal or command line:
-- pg_restore -U postgres -d Task4DB -v task4db_backup.dump

-- Step 3: Verify the Restored Data
-- After restoring the database, run the following query to verify:
SELECT * FROM Fines;
