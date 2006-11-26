-- Create script for the DOMjudge MySQL tables.
--
-- You can pipe this file into the 'mysql' command to create domjudge
-- database and users. This assumes database name 'domjudge'.
--
-- THIS FILE SHOULD ALWAYS BE NON-READABLE!
-- (because of database-login usernames/passwords)
--
-- $Id: mysql_create.sql 1170 2006-11-26 14:52:33Z eldering $

-- Create the domjudge database:
CREATE DATABASE IF NOT EXISTS domjudge;

-- Add users and passwords
-- These passwords are initialised automatically when running
-- 'make install' in the SYSTEM_ROOT and removed when running
-- 'make distclean'.
-- NOTE: by default, access is allowed from ALL hosts, make sure you
-- restrict this appropriately (or choose strong enough passwords).
USE mysql;
INSERT INTO user (Host, User, Password) VALUES ('%','domjudge_jury'  ,PASSWORD('DOMJUDGE_JURY_PASSWD'));
INSERT INTO user (Host, User, Password) VALUES ('%','domjudge_team'  ,PASSWORD('DOMJUDGE_TEAM_PASSWD'));
INSERT INTO user (Host, User, Password) VALUES ('%','domjudge_public',PASSWORD('DOMJUDGE_PUBLIC_PASSWD'));
FLUSH PRIVILEGES;