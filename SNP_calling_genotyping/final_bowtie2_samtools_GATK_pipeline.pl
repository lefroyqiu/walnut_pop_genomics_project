#/usr/bin/perl 

use strict;

my $java7dir = '/data/tool/jre1.8.0_144/bin/';
my $gatk_software = "/data/tool/GATKv3.7/GenomeAnalysisTK.jar";
my $samtools = '/data/tool/samtools-1.9/bin/samtools';

my $ref_genome = '~/Global_Walnut_Reseq_Project/Reference_genomes/Jregia.genome_v1.0.fa';
my ($fq1,$fq2,$sample_prefix);
if(@ARGV < 3){
  die "Usage: perl $0 <fq1> <fq2> <sample_prefix(sample1)>";	
}else{
  ($fq1,$fq2,$sample_prefix) = @ARGV;	
}


my $gatk_tmpfile = "$sample_prefix/GATK_tmp";

mkdir $gatk_tmpfile;
mkdir $sample_prefix;
open OUT, ">$sample_prefix/$sample_prefix.time";

my $genome_prefix = $1 if $ref_genome =~ /(.+)\.fa/;
#my $genome_index = $genome_prefix.'_index';

##### bowtie2 mapping ########
#############################
print OUT "Mapping Started: ".localtime()."\n";
system(qq(bowtie2 -p 30 -x $genome_prefix -1 $fq1 -2 $fq2 --rg-id $sample_prefix --rg "PL:ILLUMINA" --rg "SM:$sample_prefix" -S $sample_prefix/$sample_prefix.sam));
system(qq($samtools view -bS $sample_prefix/$sample_prefix.sam > $sample_prefix/$sample_prefix.bam));
system(qq($samtools sort --threads 20 -o $sample_prefix/$sample_prefix.sorted.bam $sample_prefix/$sample_prefix.bam));

#

my $sortedbam = $sample_prefix.'.sorted.bam';
system(qq($samtools index $sample_prefix/$sortedbam));
system(qq($samtools flagstat $sample_prefix/$sortedbam > $sample_prefix/$sample_prefix.flagstat));



##  quality control #######
###########################
print OUT "remove duplicated Started: ".localtime()."\n";
system(qq($samtools rmdup -sS $sample_prefix/$sample_prefix.sorted.bam $sample_prefix/$sample_prefix.rmdup.bam));
system(qq($samtools index $sample_prefix/$sample_prefix.rmdup.bam));

print OUT "Realign Started: ".localtime()."\n";
system(qq($java7dir/java -Xmx20g -Djava.io.tmpdir=$gatk_tmpfile -jar $gatk_software -R $ref_genome -T RealignerTargetCreator -o $sample_prefix/$sample_prefix.realn.intervals -I $sample_prefix/$sample_prefix.rmdup.bam));


system(qq($java7dir/java -Xmx20g -Djava.io.tmpdir=$gatk_tmpfile -jar $gatk_software -R $ref_genome -T IndelRealigner -targetIntervals $sample_prefix/$sample_prefix.realn.intervals -I $sample_prefix/$sample_prefix.rmdup.bam -o $sample_prefix/$sample_prefix.realn.bam));


&remove_file($sample_prefix,$sample_prefix);
print OUT "$sample_prefix finished: ".localtime()."\n";


###### SUB ########
###################
sub statdepth {
  my ($dir,$sortbamfile) = @_;
  system(qq($samtools depth $dir/$sortbamfile > $dir/$sortbamfile.depth));	
  open IN, "$dir/$sortbamfile.depth" or die;
  my $depth = '';
  my $coverage = '';
  while(<IN>){
    chomp;
    $depth += $2 if /(.+)\t(.+)/;	
    $coverage++;
  }
  system(qq(rm -rf $dir/$sortbamfile.depth));
  return($sortbamfile."\t".$depth."\t".$coverage);
  
}

sub remove_file {
  my ($sample_prefix,$prefixname) = @_;
  if(-f "$sample_prefix/$prefixname.sorted.bam"){
    system(qq(rm -f $sample_prefix/$prefixname.sam));	
    system(qq(rm -f $sample_prefix/$prefixname.bam));
    system(qq(rm -f $sample_prefix/$prefixname.sorted.bam.depth));
    system(qq(rm -f $sample_prefix/$prefixname.rmdup.bam));
  }	
}
