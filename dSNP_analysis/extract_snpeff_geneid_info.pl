open IN, $ARGV[0] or die "snpeffvcf";
open OUT, ">$ARGV[0].geneid";

while(<IN>){
  chomp;
  @tmp = split/\t/;
  if(/\|(Jre.+?)\|/){
    print OUT "$tmp[0]\t$tmp[1]\t$tmp[3]\t$tmp[4]\t$1\n";	
  }
}