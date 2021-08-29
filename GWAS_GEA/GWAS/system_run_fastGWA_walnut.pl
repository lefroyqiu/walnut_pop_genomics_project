
$mbfile = "walnut_16chrs_MBfiles";
$sparse_GRM = "walnut_samples_GRM_SP";
$pca_file = "walnut_GRM_PCA.eigenvec";
$pheno_dir = "~/Global_Walnut_Reseq_Project/GWAS/phenos";

open OUT, ">bash_Run_fastGWAS.sh";
while(<DATA>){
	chomp;
	next if /^\#/;
	$outprefix = $_;
	$phenofile = "$pheno_dir/$outprefix";
	$count++;
	if($count%4 == 0){
    print OUT "gcta64 --mbfile $mbfile --maf 0.05 --grm-sparse $sparse_GRM --fastGWA-mlm-exact --pheno $phenofile --qcovar $pca_file --threads 30 --out $outprefix\n";
  }else{
    print OUT "gcta64 --mbfile $mbfile --maf 0.05 --grm-sparse $sparse_GRM --fastGWA-mlm-exact --pheno $phenofile --qcovar $pca_file --threads 30 --out $outprefix &\n";
  }
}

__DATA__
walnut.phenos.BudBrunchingAbility
walnut.phenos.C16-0
walnut.phenos.C18-0
walnut.phenos.C18-1
walnut.phenos.C18-2
walnut.phenos.C18-3
walnut.phenos.ColorOfEndopleura
walnut.phenos.ContinuousFruitingAbility
walnut.phenos.CrownShape
walnut.phenos.DevelopmentBranchLength
walnut.phenos.DifferentMaturityOfMaleAndFemaleFlowers
walnut.phenos.FattyAcidContent
walnut.phenos.HullThickness
walnut.phenos.InflorescenceAxisLength
walnut.phenos.KernelPercentage
walnut.phenos.KernelPlumpness
walnut.phenos.LateralDiameter
walnut.phenos.LeafEdgeShape
walnut.phenos.LeafletShape
walnut.phenos.LeafTipShape
walnut.phenos.NumberOfLeaflets
walnut.phenos.NumberOfSideShootsWithdrawingFruit
walnut.phenos.NumberOfSingleFruit
walnut.phenos.NutBottomShape
walnut.phenos.NutDiaphragm
walnut.phenos.NutFlavor
walnut.phenos.NutInnerWall
walnut.phenos.NutShape
walnut.phenos.NutShellThickness
walnut.phenos.NutShoulderShape
walnut.phenos.NutTopShape
walnut.phenos.NutUniformity
walnut.phenos.ParietalDegeneration
walnut.phenos.Precocity
walnut.phenos.ProteinContent
walnut.phenos.ShellSealScale
walnut.phenos.ShellSurfaceFeature
walnut.phenos.SingleNutWeight
walnut.phenos.SutureFeature
walnut.phenos.TransverseDiameter
walnut.phenos.TreeHeight
walnut.phenos.TreePosture
walnut.phenos.TreeVigor
walnut.phenos.VerticalDiameter
walnut.phenos.YieldingAbility
