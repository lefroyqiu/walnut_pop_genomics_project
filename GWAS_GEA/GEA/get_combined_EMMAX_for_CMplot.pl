opendir DIR, './';

$group_exp = shift or die "Prefix name? (Huang_Nature2016)";

open OUT, ">$group_exp.combined.Pvalue";

foreach (readdir DIR){
  if(/(.+?)\.ps$/){
    $prefix = $1;
    $samples{$prefix}++;
    open IN, $_ or die;
    while(<IN>){
      chomp;
      @tmp = split/\t/;
      next if /^CHR/;
      ($snpid,$pvalue) = @tmp[0,-1];
      ($chrom,$posi) = ($1,$2) if $snpid =~ /(.+)\_(.+)/;
      $snpids{$snpid}++;
      push @snpids,$snpid if $snpids{$snpid} == 1;
      $snpid2posi{$snpid} = "$chrom\t$posi";
      $snpid2pvalue{$prefix}{$snpid} = $pvalue;
    }
  }	
}

foreach (sort keys%samples){
   $samplelist .= "$_\t";
}

$headername = "SNPid\tChr\tPosi\t$samplelist";
print OUT "$headername\n";
foreach $snpid (@snpids){
  print OUT "$snpid\t$snpid2posi{$snpid}\t";	
  foreach $prefix (sort keys%samples){
    $pvalue = $snpid2pvalue{$prefix}{$snpid};
    print OUT "$pvalue\t";
  }
  print OUT "\n";
}
