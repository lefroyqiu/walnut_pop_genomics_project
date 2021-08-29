# plink --bfile mydata --show-tags mysnps.txt

$plink_prefix = shift or die;

$cmd = "plink --bfile $plink_prefix --indep-pairwise 50 5 0.5";

system(qq($cmd));