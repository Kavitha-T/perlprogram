
use strict;
use warnings;
use File::Slurp;
use DBI;
use Config::Simple;

my @lines= read_file("table2con.ini");

my $city= 't_articles';


while (<@lines>)  {

 if (/$city/)
 {
  print "found string $city\n";
  }
  else
  
{ 
 print "did not find the string $city\n"; 
 }
 }

  