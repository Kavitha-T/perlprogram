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

#get existing dbname from user to copy


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
	     #Split line into words - word[0] = num, word[1] = filename
	     @words = split /[|]/, $lines[$x];
		 $tbname = $words[0];
		 $copytype = $words[1];
     		 
		 
		 if ($copytype == 1)
		 {
		     $sth = $dbh->prepare("CREATE TABLE IF NOT EXISTS $dbnew.$tbname LIKE $dbexisting.$tbname");
             $sth->execute() or die "SQL Error : $DBI::errstr \n";
			 print "Table structure created for $tbname.\n";
		 }
		 
		 if ($copytype == 2)
         {

             $sth = $dbh->prepare("CREATE TABLE IF NOT EXISTS $dbnew.$tbname LIKE $dbexisting.$tbname");
			 $sth->execute() or die "SQL Error : $DBI::errstr \n";
			 
			 $sth2 = $dbh->prepare("INSERT $dbnew.$tbname SELECT * FROM $dbexisting.$tbname");
             $sth2->execute() or die "SQL Error : $DBI::errstr \n";
			 print "Table data copied for $tbname.\n";

         } 
		 
		 if ($copytype == 3)
		 {
		    print "Skipped to copy $tbname";
		 }

		 
	}


#copy table structure from existing table to new table if userinput is 's'

