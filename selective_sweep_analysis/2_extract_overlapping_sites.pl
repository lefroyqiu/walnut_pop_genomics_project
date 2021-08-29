use List::Util qw(uniq);

if(@ARGV < 2){
  die "Usage: perl $0 <Ztrans file> <win_size> <Z value>";
}else{
  ($Zfile,$win_size,$Zvalue) = @ARGV;	
}

open IN, $Zfile or die;
open OUT1, ">$Zfile.$win_size.Z$Zvalue";


while(<IN>){
  chomp;
  @tmp = split/\t/;
  $chrom = $tmp[0];
  $chroms{$chrom}++;
  if($tmp[2] > $Zvalue){
    $start = $tmp[1] - $win_size;
    $end = $tmp[1] + $win_size;
    for $i (($start - 1) .. $end){
      push @{$chrom},$i;
    }
  }	
}

foreach $chrom (sort keys%chroms){
	@start_bps = ();
	@end_bps = ();
	@z_scores = ();
   @posi_base =  sort {$a<=>$b} uniq @{$chrom};
   $bases_count = scalar @posi_base;
   push @start_bps,$posi_base[0];
   for $i (0..$#posi_base - 1){
     if($posi_base[$i] + 1 != $posi_base[$i+1]){
       $pre_end = $posi_base[$i];
       $after_start = $posi_base[$i+1];
       push @start_bps,$after_start;
       push @end_bps,$pre_end;
      # push @z_scores,$zscore{$chrom."\t".$pre_end};
      # push @value,$value{$chrom."\t".$pre_end};
     }
   }
   push @end_bps,$posi_base[-1];
  # push @z_scores,$zscore{$chrom."\t".$posi_base[-1]};
  # push @value,$value{$chrom."\t".$posi_base[-1]};
 #  print OUT "$chrom\t$bases_count\n";
   @uniq_start_bps = uniq(@start_bps);
   @uniq_end_bps = uniq(@end_bps);
    for $j (0..$#uniq_start_bps){
      $start_bp = $uniq_start_bps[$j];
      $end_bp = $uniq_end_bps[$j];
      $z_score = $z_scores[$j];
      $value = $value[$j];
      $final_start_bp = $start_bp + $win_size;
      $size = $end_bp - $final_start_bp;
      #print OUT1 "$chrom\t$final_start_bp\t$end_bp\t$z_score\t$value\n";	
      print OUT1 "$chrom\t$final_start_bp\t$end_bp\t$size\n" if $final_start_bp > $win_size;	
    }
   
}

