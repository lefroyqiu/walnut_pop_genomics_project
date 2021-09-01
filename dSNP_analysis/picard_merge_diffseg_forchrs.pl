$picardsoft = "/data/tool/picard-tools-2.10.10/picard.jar";
$merge_list = shift or die "Merge list?";


system(qq(java -jar $picardsoft MergeVcfs I\=$merge_list O\=$merge_list.vcf));
