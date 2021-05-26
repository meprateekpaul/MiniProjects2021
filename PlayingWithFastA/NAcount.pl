#!/usr/bin/perl

# Script Make by Prateek Paul meprateekpaul@gmail.com
# During the internship at Rawal Genomics 
# This script counts the number of characters in the multi-fasta file

# Script has few bugs, but still does the major counting tasks.
# Do not forget to change the file names in line 10 and line 29

unless(open(FILE, "Protozoa_175positive_DNA_Prateek.fasta"))
{print "Could not open file!";}
@line = <FILE>; $line=@line;	close FILE;

$count=0;
for($i=0;$i<=$line;$i++){
    my($sign,$rest)=split("",@line[$i]);
    if($sign =~ ">"){
        #$triple = $count * 3;
        push @name, "$count\n";
        push @name, "@line[$i]";
        $count=0;
    }
    else{
        $strcount = length(@line[$i])-1;
        }
    $count=$count+$strcount;
}
push @name, "$count\n";
open($fh,'>',"dna.txt");		
		print $fh "@name";
		close file;