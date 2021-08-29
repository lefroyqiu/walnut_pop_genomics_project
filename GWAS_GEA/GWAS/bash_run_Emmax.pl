
$emmax_soft = "~/biosoftwares/emmax/emmax-intel64";
$kinship = "612samples_MAF005.GWAS.recode.hIBS.kinf";
$pheno_dir = '~/Global_Walnut_Reseq_Project/GWAS/phenos';
$geno_prefix = '612samples_MAF005.GWAS.recode';
$cov_file = "~/Global_Walnut_Reseq_Project/EMMAX_GWAS/612samples_EMMAX_withFastStructure/612samples_MAF005_ordered.fastStructure";

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
BudBrunchingAbility
C16-0
C18-0
C18-1
C18-2
C18-3
ColorOfEndopleura
ContinuousFruitingAbility
CrownShape
DevelopmentBranchLength
DifferentMaturityOfMaleAndFemaleFlowers
FattyAcidContent
HullThickness
InflorescenceAxisLength
KernelPercentage
KernelPlumpness
LateralDiameter
LeafEdgeShape
LeafletShape
LeafTipShape
NumberOfLeaflets
NumberOfSideShootsWithdrawingFruit
NumberOfSingleFruit
NutBottomShape
NutDiaphragm
NutFlavor
NutInnerWall
NutShape
NutShellThickness
NutShoulderShape
NutTopShape
NutUniformity
ParietalDegeneration
Precocity
ProteinContent
ShellSealScale
ShellSurfaceFeature
SingleNutWeight
SutureFeature
TransverseDiameter
TreeHeight
TreePosture
TreeVigor
VerticalDiameter
YieldingAbility
