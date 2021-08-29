opendir DIR, './';
$exp_id = shift or die "XieWB_data?";
$pvalue = shift or die "Pvalue?";
open OUT, ">$exp_id.Combined_Sig_SNPinfo.$pvalue.sig";

foreach (readdir DIR){
  if(/(.+?)\.ps$/){
    $prefix = $1;
    print OUT "$prefix SigSNP summary (Pvalue: $pvalue)\n";
    $count = 0;
    open IN, $_ or die;
    while(<IN>){
      chomp;
      @tmp = split/\t/;
      if($tmp[-1] < $pvalue){
        $count++;
        print OUT "$prefix\t$_\n";	
      }	
    }
    close IN;
    $count_sigSNPs = $count;
    print OUT "$prefix SigSNP: $count_sigSNPs\n\n";	
  }
}