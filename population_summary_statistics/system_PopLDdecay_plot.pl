$plot_dir = '~/biosoftwares/PopLDdecay-master/bin/Plot_MultiPop.pl';

$list = shift or die "pop_list";
$outname = "$list.outfig";

$cmd = "perl $plot_dir -inList $list -out $outname";

system(qq($cmd));

