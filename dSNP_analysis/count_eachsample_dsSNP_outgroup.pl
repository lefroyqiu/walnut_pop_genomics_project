open IN, $ARGV[0] or die;
open OUT, ">$ARGV[0].SNPcount";

while(<IN>){
  chomp;
  @tmp = split/\t/;
  next if /^\#\#/;
  if(/^\#CHRO/){
    for $i (9..$#tmp){
      $num2tit{$i} = $tmp[$i];
      push @tits,$tmp[$i];
    }   
  }else{
     if($tmp[562] =~ /0\/0/){
        for $i (9..$#tmp){
           if($tmp[$i] =~ '1/1'){
              $dSNP_homo{$num2tit{$i}}++;	
           }
           elsif($tmp[$i] =~ '0/1'){
           	  $dSNP_het{$num2tit{$i}}++;	 
           }
        }
     }
     elsif($tmp[562] =~ /1\/1/){ ## J. nigra sample geno
        for $i (9..$#tmp){
           if($tmp[$i] =~ '0/0'){
              $dSNP_homo{$num2tit{$i}}++;	
           }
           elsif($tmp[$i] =~ '0/1'){
           	  $dSNP_het{$num2tit{$i}}++;	 
           }
        }        	
     }
  }
}

foreach $tit (@tits){
  print OUT $tit."\t".$dSNP_homo{$tit}."\t".$dSNP_het{$tit}."\n";
}