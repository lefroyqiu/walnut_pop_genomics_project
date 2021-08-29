
if(@ARGV < 4){
  die "perl $0 <vcf> <sample_group> <chrom_prefix> <win_size>";	
}else{
  ($vcf,$group_name,$chrom_prefix,$win_size) = @ARGV;	
}

while(<DATA>){
  chomp;
  ($chrom,$len) = ($1,$2) if /(.+?)\t(.+)/;
  $chrom2gridnum{$chrom} = int($len/$win_size);
}

$out_prefix = $group_name.'.'.$chrom_prefix.'.'.$win_size;
$grid_num = $chrom2gridnum{$chrom_prefix};


system(qq(RAiSD -I $vcf -S $group_name -n $out_prefix -G $grid_num -f -O -P -A 0.01));

#system(qq(RAiSD -I $vcf -S $group_name -n $out_prefix -w $win_size -f -O -P -A 0.01));

__DATA__
chr1	51839233
chr2	29073151
chr3	44612423
chr4	37660743
chr5	38568468
chr6	29567712
chr7	37064596
chr8	31296728
chr9	34420500
chr10	33066936
chr11	37362885
chr12	25709904
chr13	28651323
chr14	24841007
chr15	36874183
chr16	20184194
