
$mbfile = "/data/home/qiujie/Global_Walnut_Reseq_Project/1_genotyping/denovo_genotyping_860samples/SNP_vcf/bed_format/walnut_16chrs_MBfiles";
$sparse_GRM = "/data/home/qiujie/Global_Walnut_Reseq_Project/1_genotyping/denovo_genotyping_860samples/SNP_vcf/bed_format/857samples_GRM_SP";
$pca_file = "/data/home/qiujie/Global_Walnut_Reseq_Project/1_genotyping/denovo_genotyping_860samples/SNP_vcf/bed_format/walnut_857samples_GRM_PCA.eigenvec";
#$indivs = "/data/home/qiujie/Rice_Navigation_project/GWAS_QTG_analysis/6_Huang_Nature2016/run_GCTA_FastGWA_2kSamples/Rand_select_4k_indivs.list";
$pheno_dir = "/data/home/qiujie/Global_Walnut_Reseq_Project/010_Final_860samples_GWAS/overlap_860samples_phenos";

open OUT, ">bash_Run_fastGWAS.sh";
while(<DATA>){
	chomp;
	next if /^\#/;
	$outprefix = $_;
	$phenofile = "$pheno_dir/$outprefix";
	$count++;
	if($count%4 == 0){
   # system(qq(gcta64 --mbfile $mbfile --grm-sparse $sparse_GRM --fastGWA-mlm-exact --pheno $phenofile --qcovar $pca_file --threads 30 --out $outprefix));
    print OUT "gcta64 --mbfile $mbfile --maf 0.05 --grm-sparse $sparse_GRM --fastGWA-mlm-exact --pheno $phenofile --qcovar $pca_file --threads 30 --out $outprefix\n";
  }else{
   #	system(qq(gcta64 --mbfile $mbfile --grm-sparse $sparse_GRM --fastGWA-mlm-exact --pheno $phenofile --qcovar $pca_file --threads 30 --out $outprefix &));
    print OUT "gcta64 --mbfile $mbfile --maf 0.05 --grm-sparse $sparse_GRM --fastGWA-mlm-exact --pheno $phenofile --qcovar $pca_file --threads 30 --out $outprefix &\n";
  }
}

__DATA__
walnut.860samples.phenos.BreastDiameter
walnut.860samples.phenos.BudBrunchingAbility
walnut.860samples.phenos.C16-0
walnut.860samples.phenos.C18-0
walnut.860samples.phenos.C18-1
walnut.860samples.phenos.C18-2
walnut.860samples.phenos.C18-3
walnut.860samples.phenos.ColorOfEndopleura
walnut.860samples.phenos.ContinuousFruitingAbility
walnut.860samples.phenos.CrownShape
walnut.860samples.phenos.DevelopmentBranchLength
walnut.860samples.phenos.DifferentMaturityOfMaleAndFemaleFlowers
walnut.860samples.phenos.FattyAcidContent
walnut.860samples.phenos.HullThickness
walnut.860samples.phenos.InflorescenceAxisLength
walnut.860samples.phenos.KernelPercentage
walnut.860samples.phenos.KernelPlumpness
walnut.860samples.phenos.LateralDiameter
walnut.860samples.phenos.LeafEdgeShape
walnut.860samples.phenos.LeafletShape
walnut.860samples.phenos.LeafTipShape
walnut.860samples.phenos.NumberOfLeaflets
walnut.860samples.phenos.NumberOfSideShootsWithdrawingFruit
walnut.860samples.phenos.NumberOfSingleFruit
walnut.860samples.phenos.NutBottomShape
walnut.860samples.phenos.NutDiaphragm
walnut.860samples.phenos.NutFlavor
walnut.860samples.phenos.NutInnerWall
walnut.860samples.phenos.NutShape
walnut.860samples.phenos.NutShellThickness
walnut.860samples.phenos.NutShoulderShape
walnut.860samples.phenos.NutTopShape
walnut.860samples.phenos.NutUniformity
walnut.860samples.phenos.ParietalDegeneration
walnut.860samples.phenos.Precocity
walnut.860samples.phenos.ProteinContent
walnut.860samples.phenos.ShellSealScale
walnut.860samples.phenos.ShellSurfaceFeature
walnut.860samples.phenos.SingleNutWeight
walnut.860samples.phenos.SutureFeature
walnut.860samples.phenos.TransverseDiameter
walnut.860samples.phenos.TreeAge
walnut.860samples.phenos.TreeHeight
walnut.860samples.phenos.TreePosture
walnut.860samples.phenos.TreeVigor
walnut.860samples.phenos.VerticalDiameter
walnut.860samples.phenos.YieldingAbility
