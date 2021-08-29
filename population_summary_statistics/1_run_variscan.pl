if(@ARGV < 2){
  die "Usage: perl $0 <hapmap> <config>";	
}else{
  ($hapmap,$config) = @ARGV;	
}
$prefix1 = $1 if $config =~ /(.+)\.config/;
$prefix2 = $1 if $hapmap =~ /(.+?)\./;
$outfile = "$prefix1.$prefix2.statistics";

$cmd = "variscan $hapmap $config > $outfile";
system(qq($cmd));