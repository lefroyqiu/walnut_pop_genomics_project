if(@ARGV < 1){
  die "Usage: perl $0 <chr_len>";	
}else{
  ($chr_len_file) = @ARGV;
}

open LEN, $chr_len_file;
while(<LEN>){
  chomp;
  ($chrom,$len) = ($1,$2) if /(.+?)\t(.+)/;
  $out_config = "$chrom.config";
  open OUT, ">$out_config";
  $config_info = "
  StartPos = 0
  EndPos = $len
  RefPos = 0
  BlockDataFile = none
  IndivNames = 
  SeqChoice = all
  Outgroup = none
  RefSeq = 1
  RunMode = 12
  UseMuts = 1
  CompleteDeletion = 0
  FixNum = 0
  NumNuc = 4
  SlidingWindow = 1
  WidthSW = 1000000
  JumpSW = 1000000
  WindowType = 0
  UseLDSinglets = 0
  ";
  print OUT "$config_info\n";
}
