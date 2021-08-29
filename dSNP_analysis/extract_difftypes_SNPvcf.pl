open IN, $ARGV[0] or die "vcf";
open IN1, $ARGV[1] or die "loci";

if($ARGV[0] =~ /(.+)\/(.+)/){
  $prefix = $2;	
}

$outname = $ARGV[1].'.'.$prefix;
open OUT, ">$outname";

while(<IN1>){
  chomp;
  @tmp = split/\t/;
  $loci{$tmp[0]."\t".$tmp[1]}++;	
}

while(<IN>){
  chomp;
  if(/^\#/){
    print OUT "$_\n";	
  }else{
    @tmp = split/\t/;
    if(defined $loci{$tmp[0]."\t".$tmp[1]}){
      print OUT "$_\n";	
    }	
  }
}