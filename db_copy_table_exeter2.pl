#!usr/bin/perl

use strict;
use warnings;
use File::Slurp;
use DBI;
use Config::Simple;
use 5.010;
my $driver = "mysql";
my $database = "";
my $dsn = "DBI:$driver:database=$database";
my $username = "root";
my $password = "";


my @lines;
my @words;
my $word;
my @stash;
my $dbexisting = "testtbrow";
my $dbnew; 
my $sth;
my $sth2;
my $tbname;
my $tbrow;
my $n;
my $i;
my $n2;
my $input;


#Connect to MySQL
my $dbh = DBI->connect($dsn,$username,$password);

#get dbname from user
print "Enter a name to create database:\n";
chomp($dbnew = <>);

#create db based on userinput - 
$sth = $dbh->do("CREATE DATABASE $dbnew DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci") 
or die "SQL Error : $DBI::errstr \n";

#list all tables from database
print "\nList of tables in the database $dbexisting  \n";
$sth = $dbh->prepare("SHOW TABLES FROM $dbexisting");
$sth->execute() or die "SQL Error: $DBI::errstr \n";
while ($tbrow = $sth->fetchrow_array())
 {
       
	  
	 print "$tbrow \n";
	 push (@stash, $tbrow);
 	 
}
@lines = read_file("samplecon.ini");
$n=scalar(@lines);

$sth = $dbh->prepare("SHOW TABLES FROM $dbexisting");
$sth->execute() or die "SQL Error: $DBI::errstr \n";
while ($tbname = $sth->fetchrow_array())
 {
       
	  
	 print "$tbname \n";
	 while (<@lines>) 
	 {

    if (/$tbname/)
       {
        print "found string $tbname\n";
        }
  else
  
      { 
     print "did not find the string $tbname\n"; 
      }
    }
 	 
}




	 print "Finished \n ";



