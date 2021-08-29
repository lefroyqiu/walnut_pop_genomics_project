opendir DIR, './';
open TEST, ">test_value";

foreach (readdir DIR){
  if(/chr(\d+)\.(.+?)\.statistics/){
    $popname = $2;
    $chrname = $1;
    $chrs{$chrname}++;
    $pops{$popname}++;
  #  print "$popname\n";
    open IN, $_ or die;
    while(<IN>){
      chomp;
      next if /\#/;
      @tmp = split/\s+/;
      $start = $tmp[1];
      $count{$chrname."\t".$start}++;
      if($count{$chrname."\t".$start} == 1){
        push @{$chrname},$start;
      }
     # print "$popname\n";
      ($pi,$theta,$tajima) = @tmp[-5,-4,-3];
      print TEST "$popname\t".$chrname."\t".$start."\t".$pi."\n";
      $pi_value{$popname}{$chrname."\t".$start} = $pi;
      $theta_value{$popname}{$chrname."\t".$start} = $theta;
      $tajima_value{$popname}{$chrname."\t".$start} = $tajima;
    }	
    close IN;
  }	
}

open OUT, ">combined.pi";
open OUT1, ">combined.theta";
open OUT2, ">combined.tajimaD";

print OUT "Chrname\tPosi\t";
print OUT1 "Chrname\tPosi\t";
print OUT2 "Chrname\tPosi\t";
foreach $popname (sort keys%pops){
  print OUT "$popname\t";	
  print OUT1 "$popname\t";	
  print OUT2 "$popname\t";	
}
print OUT "\n";
print OUT1 "\n";
print OUT2 "\n";
foreach $chrname (sort {$a<=>$b} keys%chrs){
	#print "$chrname\n";
	foreach $start (@{$chrname}){
	   print OUT "$chrname\t$start\t";
	   print OUT1 "$chrname\t$start\t";
	   print OUT2 "$chrname\t$start\t";
	   foreach $popname (sort keys%pops){
	   #	 print "$popname\n";
	     $pi_score = $pi_value{$popname}{$chrname."\t".$start};
	     $theta_score = $theta_value{$popname}{$chrname."\t".$start};
	     $tajimaD_score = $tajima_value{$popname}{$chrname."\t".$start};
	     print OUT "$pi_score\t";
	     print OUT1 "$theta_score\t";
	     print OUT2 "$tajimaD_score\t";
	   }
	   print OUT "\n";
	   print OUT1 "\n";
	   print OUT2 "\n";
	}
}