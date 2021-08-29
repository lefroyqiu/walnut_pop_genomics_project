use File::Basename;

if(@ARGV < 2){
  die "Usage: perl $0 <District> <Hapmap>";	
}else{
  ($district,$hapmap) = @ARGV;	
}

($hapmapname,$path1,$suffix1) = fileparse($hapmap,(".hapmap"));
($districtname,$path2,$suffix2) = fileparse($district,(".txt"));
#print $vcfname."\n";

open OUT, ">$districtname.$hapmapname.hapmap";
open IN, $district or die;
while(<IN>){
  chomp;
  $names{$_}++;
  push @names,$_;
}

open IN1, $hapmap or die;
while(<IN1>){
  chomp;
  $line++; 
  if(/((.+?)\t(.+?)\t(.+?)\t(.+?)\t(.+?)\t(.+?)\t(.+?)\t(.+?)\t(.+?)\t(.+?)\t(.+?))\t(.+)/){
    $markers = $1;
    $samples = $13;
    @samples = split/\t/,$samples;
    if($line == 1){
   	print OUT "$markers\t";
     for $i (0..$#samples){
       if(defined $names{$samples[$i]}){
         $mark{$i}++;
       }	
     }
     foreach $id (sort {$a<=>$b} keys%mark){
     	 $combined_id .= "$samples[$id]\t"; 	 
     #  print OUT "$samples[$id]\t";	
     }
     chop $combined_id;
     print OUT "$combined_id\n";	
   }else{
     %checkhash = ();
     $combined_genos = '';
     foreach (sort {$a<=>$b} keys%mark){
     	 $combined_genos .= $samples[$_]."\t";
     	 $checkhash{$samples[$_]}++;
     }
     if(scalar keys %checkhash > 1){
       chop $combined_genos;
       print OUT "$markers\t$combined_genos\n";	
     }
   }	
 }
}
