$sift_script = '~/biosoftwares/dSNP_identification/SIFT4G/scripts_to_build_SIFT_db/make-SIFT-db-all.pl';

$config = shift or die "Jregia config";

system(qq(perl $sift_script -config $config));