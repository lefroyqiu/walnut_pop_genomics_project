open IN, $ARGV[0] or die "vcf£¿";
open OUT, ">$ARGV[0].count_het_snps";

while(<IN>){
  chomp;
  @tmp = split/\t/;
  next if /\#\#/;
  if(/\#CHROM/){
    for $i (9..$#tmp){
       $num2tit{$i} = $tmp[$i];
       push @samples,$tmp[$i];
    }
  }else{
  	if($tmp[562] =~ /0\/0/){
  	  $out_geno = "Ref";	
  	}
  	elsif($tmp[562] =~ /1\/1/){
  	 	$out_geno = 'Alt';
  	}
    for $i (9..$#tmp){
    	$genoinfo = $tmp[$i];
    	if($genoinfo =~ /1\/1/ and $out_geno eq 'Ref'){
    	  $count_all_snps{$num2tit{$i}}++;
    	  $count_homo_snps{$num2tit{$i}}++;	
    	}
    	elsif($genoinfo =~ /0\/1/ and $out_geno eq 'Ref'){
    	  $count_all_snps{$num2tit{$i}}++;
    	  $count_het_snps{$num2tit{$i}}++;	    	  	
    	}
    	elsif($genoinfo =~ /0\/0/ and $out_geno eq 'Alt'){
    	  $count_all_snps{$num2tit{$i}}++;
    	  $count_homo_snps{$num2tit{$i}}++;    	  	
    	}
    	elsif($genoinfo =~ /0\/1/ and $out_geno eq 'Alt'){
    	  $count_all_snps{$num2tit{$i}}++;
    	  $count_het_snps{$num2tit{$i}}++;    	  	
    	}
    }
  }
}

foreach $sample (@samples){
   $homo_snps = $count_homo_snps{$sample} || 0;	
   $het_snps = $count_het_snps{$sample} || 0;	
   $all_snps = $count_all_snps{$sample} || 0;	
   print OUT "$sample\t$homo_snps\t$het_snps\t$all_snps\n";
}