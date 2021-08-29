#!/usr/bin/perl

use strict;
use warnings;

my $vcf;
my @samples;

if(@ARGV < 3){
  die "Usage: perl $0 <VCF> <samplesfiles>";
}else{
  ($vcf,@samples) = @ARGV;
}
my $out = join("_",@samples);

my $combined_pop = "$samples[0] --weir-fst-pop $samples[1]";

print "$combined_pop\n";

my $chr_prefix;
if($vcf =~ /(.+)\/(.+?)\.vcf/){
  $chr_prefix = $2;	
}
elsif($vcf =~ /(.+?)\.vcf/){
	$chr_prefix = $1;
}

my $Fst_out = "$out.$chr_prefix.Fst";

system(qq(vcftools --vcf $vcf --fst-window-size 1000000 --fst-window-step 1000000 --weir-fst-pop $combined_pop --out $Fst_out));