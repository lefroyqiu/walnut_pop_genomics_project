open LEN, 'Jregia.genome_v1.0.fa.chr_len' or die;

$sigfile = shift or die "Sig file?";
$bin_size = shift or die "Bin Size? (1000000)";


$outfile = "$sigfile.$bin_size.PeakSNP";
open OUT, ">$outfile";

while(<LEN>){
  chomp;
  $chr2binnum{$1} = int($2/$bin_size) + 1 if /Chr(.+?)\t(.+)/i;
}

open IN, $sigfile;

while(<IN>){
  chomp;
  @tmp = split/\t/;
  if(/(.+) SigSNP summary \(Pvalue\:/){
  	print OUT "\n$_\n";
  	print OUT "PhenoID\tChrom\tRange\tNo.SigSNPs\tPeakSNP\tPeakSNP_Pvalue\tMajor->Minor|MinorAF|SNPEFF|SE\n";
    $type = $1;
    push @types,$type;
   # print OUT "$_\n";
  }
  elsif(scalar @tmp > 1){
    #($chrom,$posi,$pvalue) = @tmp[1,3,-1];
    ($snpid,$snpeff,$se,$pvalue) = @tmp[1,2,3,4];
    ($chrom,$posi) = ($1,$2) if $snpid =~ /(.+?)\_(.+)/;
 #   print "$posi\n";
    #print "$_\n";
    $pvalue{$type}{$snpid} = $pvalue;
   # $snpeffinfo{$type}{$snpid} = "$tmp[5]->$tmp[4]\|$tmp[7]\|$tmp[8]\|$tmp[9]";
    $snpeffinfo{$type}{$snpid} = "$snpeff\|$se";
   # print "$snpeff\|$se\n";
    for $i (1..$chr2binnum{$chrom}){
    	
      $start = ($i - 1) * $bin_size;
      $end = $i * $bin_size;
      $range = $chrom.'_'.$start.'_'.$end;
    #  print "$start\t$end\t$posi\n";
      if($posi >= $start and $posi < $end){
      	#print "test\n";
        $count{$type}{$range}++;
        push @{$snps{$type}{$range}},$snpid;
        push @{$pvalue_range{$type}{$range}},$pvalue;
      #  print "$snpid\t$type\t$chrom\t$range\t$count{$type}{$range}\n";
      }	
    }
  }
  elsif(/SigSNP\:/){
  	for $i (1..16){
  		$chromid = $i;
  	  for $j (1..$chr2binnum{$i}){
        $start = ($j - 1) * $bin_size;
        $end = $j * $bin_size;
        $range = $chromid.'_'.$start.'_'.$end;
        $fmt_range = $chromid.'|'.($start/1e6).'-'.($end/1e6).'M';
      #  print "$fmt_range\n";
  	    if($count{$type}{$range} >= 1){
  	    	@sorted_pvalue = sort {$a<=>$b} @{$pvalue_range{$type}{$range}};
  	    	print scalar @sorted_pvalue."\n";
  	    	$min_pvalue = $sorted_pvalue[0];
  	      @snpids_in_range = @{$snps{$type}{$range}};
  	      foreach $snpid (@snpids_in_range){
  	        if($pvalue{$type}{$snpid} == $min_pvalue){
  	        	 $count_sigSNPs = $count{$type}{$range};
  	           $snpeffinfo = $snpeffinfo{$type}{$snpid};
  	           if($count_sigSNPs > 5){
  	           	
  	             print OUT "$type\t$chromid\t$fmt_range\t$count_sigSNPs\t$snpid\t$min_pvalue\t$snpeffinfo\n";	
  	            # last;
  	           }
  	        }
  	      }
  	    }
  	  }	
  	}
    print OUT "$_\n";
  }
}