#!usr/bin/perl

use strict;
use warnings;
use File::Slurp;
use DBI;
use Config::Simple;

my $driver = "mysql";
my $database = "";
my $dsn = "DBI:$driver:database=$database";
my $username = "root";
my $password = "";

my @row;
my @lines;
my @words;
my $dbexisting;
my $dbnew; 
my $sth;
my $sth2;
my $tbname;
my $copytype;
my $n;
my $x;

#Connect to MySQL
my $dbh = DBI->connect($dsn,$username,$password);

#get dbname from user
print "Enter a name to create database:\n";
chomp($dbnew = <>);

#create db based on userinput - 
$sth = $dbh->do("CREATE DATABASE IF NOT EXISTS $dbnew");

#list the dabasename from mysql
print "\nList of all database \n";
$sth = $dbh->prepare("SHOW DATABASES");
$sth->execute or die "SQL Error: $DBI::errstr\n";
while ( @row = $sth->fetchrow_array )
     {
         #print $row[1];
         print "@row\n";
     }


print "\n";

#get existing dbname from user to copy
#store existing dbname in var dbexisting
print "Enter a database name form the list above:\n";
chomp($dbexisting = <>);


#open the ini-file of the existing db
@lines = read_file("$dbexisting.ini");
print @lines;

print "\n no of lines:\n";
$n = scalar(@lines);
 for($x=0;$x<=$n;$x++)
	{
	     #Split line into words - word[0] = tablename, word[1] = copytype
	     @words = split /[|]/, $lines[$x];
		 $tbname = $words[0];
		 $copytype = $words[1];
     		 
		 #copy only the table structure if copytype is 1
		 if ($copytype == 1)
		 {
		     $sth = $dbh->prepare("CREATE TABLE IF NOT EXISTS $dbnew.$tbname LIKE $dbexisting.$tbname");
             $sth->execute() or die "SQL Error : $DBI::errstr \n";
			 print "Table structure created for $tbname.\n";
		 }
		 
		 #copy the table structure and data if copytype is 2
		 if ($copytype == 2)
         {

             $sth = $dbh->prepare("CREATE TABLE IF NOT EXISTS $dbnew.$tbname LIKE $dbexisting.$tbname");
			 $sth->execute() or die "SQL Error : $DBI::errstr \n";
			 
			 $sth2 = $dbh->prepare("INSERT IGNORE INTO $dbnew.$tbname SELECT * FROM $dbexisting.$tbname");
             $sth2->execute() or die "SQL Error : $DBI::errstr \n";
			 
			 print "Table data copied for $tbname.\n";

         } 
		 
		 #skip to copy the table if copytype is 3
		 if ($copytype == 3)
		 {
		    print "Skipped to copy $tbname";
		 }

	}



