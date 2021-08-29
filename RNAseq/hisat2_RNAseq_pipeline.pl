#!/usr/bin/perl -w

#use strict;
use POSIX;

my $ref_genome = '~/Global_Walnut_Reseq_Project/Reference_genomes/Jregia.genome_v1.0.fa';
my $GTF_GFF_file = '~/Global_Walnut_Reseq_Project/Reference_genomes/Jregia.genome_v1.2.gff3';

my ($fq1,$fq2,$sample_prefix);

if(@ARGV < 3){
  die "Usage: perl $0 <fq1> <fq2> <sample_prefix(YG02)>";	
}else{
  ($fq1,$fq2,$sample_prefix) = @ARGV;	
}


mkdir $sample_prefix;

my $process_time_file = "$sample_prefix/$sample_prefix.process_time";
open TIME, ">$sample_prefix/$sample_prefix.process_time";

my $genome_prefix = $1 if $ref_genome =~ /(.+)\.fa/;


##### HISAT2 mapping #########
##############################

print TIME "\n$sample_prefix HISAT2 mapping started\t".localtime()."\n";
system(qq(hisat2 -p 20 -x $genome_prefix -1 $fq1 -2 $fq2 --rg-id $sample_prefix --rg "PL:ILLUMINA" --rg "SM:$sample_prefix" -S $sample_prefix/$sample_prefix.sam));

print TIME "\n$sample_prefix Samtools mapping started\t".localtime()."\n";

system(qq(samtools sort -@ 20 -O bam -o $sample_prefix/$sample_prefix.bam -T $sample_prefix/temp $sample_prefix/$sample_prefix.sam));

remove_file($sample_prefix,$sample_prefix);

print TIME "\n$sample_prefix Stringtie mapping started\t".localtime()."\n";

system(qq(stringtie -p 20 -G $GTF_GFF_file -e -A ./$sample_prefix/$sample_prefix.stringtie.out -B -o ./$sample_prefix/$sample_prefix.gtf $sample_prefix/$sample_prefix.bam));

print TIME "\nAll finished\t".localtime()."\n";



sub remove_file {
  my ($sample_prefix,$prefixname) = @_;
  if(-f "$sample_prefix/$prefixname.bam"){
    system(qq(rm -f $sample_prefix/$prefixname.sam));	
  }	
}