$lddecay_soft = '~/biosoftwares/PopLDdecay-master/PopLDdecay';
my ($vcf,$samplename);

if(@ARGV ne 2){
  die "Usage: perl $0 <vcf> <samplelist>";	
}else{
  ($vcf,$samplename) = @ARGV;	
}

print "$vcf\n$samplename\n";
if($samplename =~ /(.+)\/(.+?)\./){
  $sample_prefix = $2; 	
}
elsif($samplename =~ /(.+?)\./){
  $sample_prefix = $1; 		
}

if($vcf =~ /(.+)\/(.+?)\./){
  $chr_prefix = $2; 	
}
elsif($vcf =~ /(.+?)\./){
  $chr_prefix = $1; 		
}

my $final_prefix = $sample_prefix.'.'.$chr_prefix;

system(qq($lddecay_soft -InVCF $vcf -OutStat $final_prefix -SubPop $samplename));