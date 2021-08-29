
$emmax_soft = "/data/home/qiujie/biosoftwares/emmax/emmax-intel64";
$kinship = "/data/home/qiujie/Global_Walnut_Reseq_Project/8_GEA_analysis/JS_JR1_GEA_GWAS/GEA_EMMAX_analysis/samples_vcfs/492walnut_MAF005_16chrs.list.hIBS.kinf";
$pheno_dir = '/data/home/qiujie/Global_Walnut_Reseq_Project/8_GEA_analysis/JS_JR1_GEA_GWAS/GEA_EMMAX_analysis/phenos';
$geno_prefix = '/data/home/qiujie/Global_Walnut_Reseq_Project/8_GEA_analysis/JS_JR1_GEA_GWAS/GEA_EMMAX_analysis/samples_vcfs/492walnut_MAF005_16chrs.list';
$cov_file = "/data/home/qiujie/Global_Walnut_Reseq_Project/8_GEA_analysis/JS_JR1_GEA_GWAS/GEA_EMMAX_analysis/samples_vcfs/492walnut_MAF005_ordered.fastStructure";

open OUT, ">all_phenos_bash_EMMAX_GEA.sh";

while(<DATA>){
  chomp;	
  $pheno_data = $pheno_dir.'/'.$_;
  $outname = $2.'_EMMAX' if /(.+?)\.(.+)/;
  $cmd = "$emmax_soft -v -d 10 -t $geno_prefix -o $outname -p $pheno_data -k $kinship -c $cov_file";
  $count++;
  if($count % 2 == 0){
    print OUT "$cmd\n";	
  }else{
    print OUT "$cmd &\n";	
  }
}

__DATA__
JS_JR1_samples_env_data.altitude
JS_JR1_samples_env_data.bio1
JS_JR1_samples_env_data.bio10
JS_JR1_samples_env_data.bio11
JS_JR1_samples_env_data.bio12
JS_JR1_samples_env_data.bio13
JS_JR1_samples_env_data.bio14 
JS_JR1_samples_env_data.bio15
JS_JR1_samples_env_data.bio16
JS_JR1_samples_env_data.bio17
JS_JR1_samples_env_data.bio18
JS_JR1_samples_env_data.bio19
JS_JR1_samples_env_data.bio2
JS_JR1_samples_env_data.bio3
JS_JR1_samples_env_data.bio4
JS_JR1_samples_env_data.bio5
JS_JR1_samples_env_data.bio6
JS_JR1_samples_env_data.bio7
JS_JR1_samples_env_data.bio8
JS_JR1_samples_env_data.bio9
JS_JR1_Tibet_samples_env_data.altitude
