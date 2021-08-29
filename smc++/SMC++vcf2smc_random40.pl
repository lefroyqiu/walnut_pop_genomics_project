
#! /usr/bin/perl
 
$vcf="~/Global_Walnut_Reseq_Project/5_SMC/vcf2bgzip";

$group="Jsigillata_40samples";#"Jregia_G1_40samples";
$total=76;
#$total=251;
system(qq(mkdir $group));
$samples="~/Global_Walnut_Reseq_Project/5_SMC/1_final_run_vcf2smc/JS_all/JS.names"; #Jsigillata
#$samples="~/Global_Walnut_Reseq_Project/5_SMC/1_final_run_vcf2smc/JR_G1/JR_G1.names"; #Jregia_G1

$output="~/walnut/SMC/vcf2smc";

open IN,"$samples";
while (<IN>) {
	chomp;
	push @all_sample,$_;
}
		
for ($aa = 1; $aa < 6; $aa++) {
	$d_sample=$aa;
	my @temp;
	my $line;	
	for ($i = 0; $i < 40; $i++) {
		 $num=int(rand($total))+1;
	if (grep {$num==$_} @temp) {
		}
	else{
		push @temp,$num;
		$line.=$all_sample[$num].",";	
		}
	}		
  $line=~s/\,$//;
	system("mkdir $output/$group/$d_sample");
	system("mkdir $output/$group/$d_sample\/estimate");		
	open OUT,">$output/$group/$d_sample\/bashcode_vcf2smc";
	open OUT1,">$output/$group/$d_sample\/estimate/bashcode_estimate";

	$j=1;
	while ($j<17) {
		print OUT "nohup smc++ vcf2smc --cores 10 --ignore-missing $vcf\/Chr$j\.recode.vcf.gz $output/$group/$d_sample/$group\.chr$j\.smc.gz chr$j $group\:$line & \n";
		 $j++;
	}
		print OUT1 "nohup smc++ estimate --cores 120 -o $output/$group/$d_sample\/estimate 2.5e-9 $output/$group/$d_sample/$group\.chr*.gz & \n";
}

