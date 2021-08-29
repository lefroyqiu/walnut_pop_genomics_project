
$emmax_soft = "/data/home/qiujie/biosoftwares/emmax/emmax-intel64";
$kinship = "/data/home/qiujie/Global_Walnut_Reseq_Project/For_Revision1/EMMAX_GWAS/EMMAX_Run/612samples_MAF005.GWAS.recode.hIBS.kinf";
$pheno_dir = '/data/home/qiujie/Global_Walnut_Reseq_Project/For_Revision1/EMMAX_GWAS/612samples_phenos';
$geno_prefix = '/data/home/qiujie/Global_Walnut_Reseq_Project/For_Revision1/EMMAX_GWAS/612samples_with_pheno_vcfs/612samples_MAF005.GWAS.recode';
$cov_file = "/data/home/qiujie/Global_Walnut_Reseq_Project/For_Revision1/EMMAX_GWAS/612samples_EMMAX_withFastStructure/612samples_MAF005_ordered.fastStructure";

open OUT, ">all_phenos_bash_EMMAX_GWAS.sh";

while(<DATA>){
  chomp;	
  $pheno_data = $pheno_dir.'/'.$_;
  $outname = $2.'_EMMAX' if /(.+?)\.(.+)/;
  $cmd = "$emmax_soft -v -d 10 -t $geno_prefix -o $outname -p $pheno_data -k $kinship -c $cov_file";
  $count++;
  if($count % 10 == 0){
    print OUT "$cmd\n";	
  }else{
    print OUT "$cmd &\n";	
  }
}

__DATA__
neworder_612samples_pheno.BreastDiameter
neworder_612samples_pheno.BudBrunchingAbility
neworder_612samples_pheno.C16-0
neworder_612samples_pheno.C18-0
neworder_612samples_pheno.C18-1
neworder_612samples_pheno.C18-2
neworder_612samples_pheno.C18-3
neworder_612samples_pheno.ColorOfEndopleura
neworder_612samples_pheno.ContinuousFruitingAbility
neworder_612samples_pheno.CrownShape
neworder_612samples_pheno.DevelopmentBranchLength
neworder_612samples_pheno.DifferentMaturityOfMaleAndFemaleFlowers
neworder_612samples_pheno.FattyAcidContent
neworder_612samples_pheno.HullThickness
neworder_612samples_pheno.InflorescenceAxisLength
neworder_612samples_pheno.KernelPercentage
neworder_612samples_pheno.KernelPlumpness
neworder_612samples_pheno.LateralDiameter
neworder_612samples_pheno.LeafEdgeShape
neworder_612samples_pheno.LeafletShape
neworder_612samples_pheno.LeafTipShape
neworder_612samples_pheno.NumberOfLeaflets
neworder_612samples_pheno.NumberOfSideShootsWithdrawingFruit
neworder_612samples_pheno.NumberOfSingleFruit
neworder_612samples_pheno.NutBottomShape
neworder_612samples_pheno.NutDiaphragm
neworder_612samples_pheno.NutFlavor
neworder_612samples_pheno.NutInnerWall
neworder_612samples_pheno.NutShape
neworder_612samples_pheno.NutShellThickness
neworder_612samples_pheno.NutShoulderShape
neworder_612samples_pheno.NutTopShape
neworder_612samples_pheno.NutUniformity
neworder_612samples_pheno.ParietalDegeneration
neworder_612samples_pheno.Precocity
neworder_612samples_pheno.ProteinContent
neworder_612samples_pheno.ShellSealScale
neworder_612samples_pheno.ShellSurfaceFeature
neworder_612samples_pheno.SingleNutWeight
neworder_612samples_pheno.SutureFeature
neworder_612samples_pheno.TransverseDiameter
neworder_612samples_pheno.TreeAge
neworder_612samples_pheno.TreeHeight
neworder_612samples_pheno.TreePosture
neworder_612samples_pheno.TreeVigor
neworder_612samples_pheno.VerticalDiameter
neworder_612samples_pheno.YieldingAbility
