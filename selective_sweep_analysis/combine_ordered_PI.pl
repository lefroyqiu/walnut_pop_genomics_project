opendir DIR, './';
open OUT, ">combine_ordered_Pi";

foreach (readdir DIR){
  if(/(.+?)\.names\.(.+)pi$/){
    $title = $1;
    $titles{$title}++;
    open IN, $_ or die;
    while(<IN>){
      chomp;
      if(/(.+?)\t(.+?)\t(.+)\t(.+)/){
        $loci = $1."\t".$2;
        push @{$1},$2;
        $fst{$title}{$loci} = $4;	
      }
    }	
  }	
}

print OUT "Chr\tloci\t";
foreach $tit (sort keys%titles){
  print OUT "$tit\t";
}
print OUT "\n";

while(<DATA>){
  chomp;
  $chr = $_; 
  foreach $loci (@{$chr}){
  	$count{$chr."\t".$loci}++;
  	if($count{$chr."\t".$loci} == 1){
    print OUT "$chr\t$loci\t";
    foreach $tit (sort keys%titles){
      $fstvalue = $fst{$tit}{$chr."\t".$loci};
      $shorvalue = sprintf("%.5f",$fstvalue);
      print OUT	"$shorvalue\t";
    }
    print OUT "\n";	
   }
  }	
}


__DATA__
chr1
chr2
chr3
chr4
chr5
chr6
chr7
chr8
chr9
chr10
chr11
chr12
chr13
chr14
chr15
chr16
