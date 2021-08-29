mkdir Chr1.gatk_tmp
java -Djava.io.tmpdir=./Chr1.gatk_tmp/ -Xmx500g -jar /data/tool/GATKv3.7/GenomeAnalysisTK.jar -R /data/home/qiujie/Global_Walnut_Reseq_Project/Reference_genomes/Jregia.genome_v1.0.fa -T UnifiedGenotyper -I walnut_samples_realign_bam.list -o Chr1.denovo_genotyping_Jregia.vcf -nct 6 -nt 8 -stand_call_conf 30 -L chr1 -glm SNP
mkdir Chr2.gatk_tmp
java -Djava.io.tmpdir=./Chr2.gatk_tmp/ -Xmx500g -jar /data/tool/GATKv3.7/GenomeAnalysisTK.jar -R /data/home/qiujie/Global_Walnut_Reseq_Project/Reference_genomes/Jregia.genome_v1.0.fa -T UnifiedGenotyper -I walnut_samples_realign_bam.list -o Chr2.denovo_genotyping_Jregia.vcf -nct 6 -nt 8 -stand_call_conf 30 -L chr2 -glm SNP
mkdir Chr3.gatk_tmp
java -Djava.io.tmpdir=./Chr3.gatk_tmp/ -Xmx500g -jar /data/tool/GATKv3.7/GenomeAnalysisTK.jar -R /data/home/qiujie/Global_Walnut_Reseq_Project/Reference_genomes/Jregia.genome_v1.0.fa -T UnifiedGenotyper -I walnut_samples_realign_bam.list -o Chr3.denovo_genotyping_Jregia.vcf -nct 6 -nt 8 -stand_call_conf 30 -L chr3 -glm SNP
mkdir Chr4.gatk_tmp
java -Djava.io.tmpdir=./Chr4.gatk_tmp/ -Xmx500g -jar /data/tool/GATKv3.7/GenomeAnalysisTK.jar -R /data/home/qiujie/Global_Walnut_Reseq_Project/Reference_genomes/Jregia.genome_v1.0.fa -T UnifiedGenotyper -I walnut_samples_realign_bam.list -o Chr4.denovo_genotyping_Jregia.vcf -nct 6 -nt 8 -stand_call_conf 30 -L chr4 -glm SNP
mkdir Chr5.gatk_tmp
java -Djava.io.tmpdir=./Chr5.gatk_tmp/ -Xmx500g -jar /data/tool/GATKv3.7/GenomeAnalysisTK.jar -R /data/home/qiujie/Global_Walnut_Reseq_Project/Reference_genomes/Jregia.genome_v1.0.fa -T UnifiedGenotyper -I walnut_samples_realign_bam.list -o Chr5.denovo_genotyping_Jregia.vcf -nct 6 -nt 8 -stand_call_conf 30 -L chr5 -glm SNP
mkdir Chr6.gatk_tmp
java -Djava.io.tmpdir=./Chr6.gatk_tmp/ -Xmx500g -jar /data/tool/GATKv3.7/GenomeAnalysisTK.jar -R /data/home/qiujie/Global_Walnut_Reseq_Project/Reference_genomes/Jregia.genome_v1.0.fa -T UnifiedGenotyper -I walnut_samples_realign_bam.list -o Chr6.denovo_genotyping_Jregia.vcf -nct 6 -nt 8 -stand_call_conf 30 -L chr6 -glm SNP
mkdir Chr7.gatk_tmp
java -Djava.io.tmpdir=./Chr7.gatk_tmp/ -Xmx500g -jar /data/tool/GATKv3.7/GenomeAnalysisTK.jar -R /data/home/qiujie/Global_Walnut_Reseq_Project/Reference_genomes/Jregia.genome_v1.0.fa -T UnifiedGenotyper -I walnut_samples_realign_bam.list -o Chr7.denovo_genotyping_Jregia.vcf -nct 6 -nt 8 -stand_call_conf 30 -L chr7 -glm SNP
mkdir Chr8.gatk_tmp
java -Djava.io.tmpdir=./Chr8.gatk_tmp/ -Xmx500g -jar /data/tool/GATKv3.7/GenomeAnalysisTK.jar -R /data/home/qiujie/Global_Walnut_Reseq_Project/Reference_genomes/Jregia.genome_v1.0.fa -T UnifiedGenotyper -I walnut_samples_realign_bam.list -o Chr8.denovo_genotyping_Jregia.vcf -nct 6 -nt 8 -stand_call_conf 30 -L chr8 -glm SNP
mkdir Chr9.gatk_tmp
java -Djava.io.tmpdir=./Chr9.gatk_tmp/ -Xmx500g -jar /data/tool/GATKv3.7/GenomeAnalysisTK.jar -R /data/home/qiujie/Global_Walnut_Reseq_Project/Reference_genomes/Jregia.genome_v1.0.fa -T UnifiedGenotyper -I walnut_samples_realign_bam.list -o Chr9.denovo_genotyping_Jregia.vcf -nct 6 -nt 8 -stand_call_conf 30 -L chr9 -glm SNP
mkdir Chr10.gatk_tmp
java -Djava.io.tmpdir=./Chr10.gatk_tmp/ -Xmx500g -jar /data/tool/GATKv3.7/GenomeAnalysisTK.jar -R /data/home/qiujie/Global_Walnut_Reseq_Project/Reference_genomes/Jregia.genome_v1.0.fa -T UnifiedGenotyper -I walnut_samples_realign_bam.list -o Chr10.denovo_genotyping_Jregia.vcf -nct 6 -nt 8 -stand_call_conf 30 -L chr10 -glm SNP
mkdir Chr11.gatk_tmp
java -Djava.io.tmpdir=./Chr11.gatk_tmp/ -Xmx500g -jar /data/tool/GATKv3.7/GenomeAnalysisTK.jar -R /data/home/qiujie/Global_Walnut_Reseq_Project/Reference_genomes/Jregia.genome_v1.0.fa -T UnifiedGenotyper -I walnut_samples_realign_bam.list -o Chr11.denovo_genotyping_Jregia.vcf -nct 6 -nt 8 -stand_call_conf 30 -L chr11 -glm SNP
mkdir Chr12.gatk_tmp
java -Djava.io.tmpdir=./Chr12.gatk_tmp/ -Xmx500g -jar /data/tool/GATKv3.7/GenomeAnalysisTK.jar -R /data/home/qiujie/Global_Walnut_Reseq_Project/Reference_genomes/Jregia.genome_v1.0.fa -T UnifiedGenotyper -I walnut_samples_realign_bam.list -o Chr12.denovo_genotyping_Jregia.vcf -nct 6 -nt 8 -stand_call_conf 30 -L chr12 -glm SNP
mkdir Chr13.gatk_tmp
java -Djava.io.tmpdir=./Chr13.gatk_tmp/ -Xmx500g -jar /data/tool/GATKv3.7/GenomeAnalysisTK.jar -R /data/home/qiujie/Global_Walnut_Reseq_Project/Reference_genomes/Jregia.genome_v1.0.fa -T UnifiedGenotyper -I walnut_samples_realign_bam.list -o Chr13.denovo_genotyping_Jregia.vcf -nct 6 -nt 8 -stand_call_conf 30 -L chr13 -glm SNP
mkdir Chr14.gatk_tmp
java -Djava.io.tmpdir=./Chr14.gatk_tmp/ -Xmx500g -jar /data/tool/GATKv3.7/GenomeAnalysisTK.jar -R /data/home/qiujie/Global_Walnut_Reseq_Project/Reference_genomes/Jregia.genome_v1.0.fa -T UnifiedGenotyper -I walnut_samples_realign_bam.list -o Chr14.denovo_genotyping_Jregia.vcf -nct 6 -nt 8 -stand_call_conf 30 -L chr14 -glm SNP
mkdir Chr15.gatk_tmp
java -Djava.io.tmpdir=./Chr15.gatk_tmp/ -Xmx500g -jar /data/tool/GATKv3.7/GenomeAnalysisTK.jar -R /data/home/qiujie/Global_Walnut_Reseq_Project/Reference_genomes/Jregia.genome_v1.0.fa -T UnifiedGenotyper -I walnut_samples_realign_bam.list -o Chr15.denovo_genotyping_Jregia.vcf -nct 6 -nt 8 -stand_call_conf 30 -L chr15 -glm SNP
mkdir Chr16.gatk_tmp
java -Djava.io.tmpdir=./Chr16.gatk_tmp/ -Xmx500g -jar /data/tool/GATKv3.7/GenomeAnalysisTK.jar -R /data/home/qiujie/Global_Walnut_Reseq_Project/Reference_genomes/Jregia.genome_v1.0.fa -T UnifiedGenotyper -I walnut_samples_realign_bam.list -o Chr16.denovo_genotyping_Jregia.vcf -nct 6 -nt 8 -stand_call_conf 30 -L chr16 -glm SNP
