#!/usr/bin/perl

use strict;
use warnings;

my ($vcf,$samples);

if(@ARGV < 2){
  die "Usage: perl $0 <VCF> <samplesfile>";
}else{
  ($vcf,$samples) = @ARGV;
}

my $chr_prefix;
if($vcf =~ /(.+)\/(.+?)\./){
  $chr_prefix = $2;	
}
elsif($vcf =~ /(.+?)\./){
	$chr_prefix = $1;
}


my $piout = "$samples.$chr_prefix.win100k.step10k.pi";
system(qq(vcftools --vcf $vcf --keep $samples --window-pi 100000 --window-pi-step 10000 --out $piout));