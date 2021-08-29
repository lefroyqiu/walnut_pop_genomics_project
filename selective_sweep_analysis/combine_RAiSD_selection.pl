opendir DIR, './';
$prefix = shift or die "Prefix? (walnut_100K?)";
open OUT, ">$prefix.RAiSD_combined_chrs_info";

foreach $file (readdir DIR){
	#print "$file\n";
	if($file =~ /RAiSD_Report(.+)\.names\.(.+)/){
	#	print "$2\n";
	  open IN, $file or die;
	  $chrom_info = $2;
	  if($chrom_info =~ /(.+?)\./){
	    $chrom = 	$1;
	  }else{
	    $chrom = $chrom_info;	
	  }
    while(<IN>){
      chomp;
      @tmp = split/\t/;
      next if /^\/|Position/;
      $region = $tmp[0];
      push @{$chrom},$region;
      
      $likelihood{$chrom."\t".$region} = $tmp[-1];
     #$alpha{$chrom."\t".$region} = $tmp[2];
      #print OUT "$chrom_info\t$region\t$likelihood\t$alpha\n";
    }	
	}
}

for $i (1..16){
	$chrom = "chr$i";
  foreach $region (@{$chrom}){
     $chrom_region = $chrom."\t".$region;
    # print "$chrom_region\n";
     print OUT $chrom_region."\t".$likelihood{$chrom_region}."\n";
  }
}

