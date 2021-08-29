library("CMplot")
setwd("/data/home/qiujie/Global_Walnut_Reseq_Project/For_Revision1/EMMAX_GWAS/612samples_EMMAX_withFastStructure/combine_CMplot")
GWAS <- read.table("47traits_612samples_withFastStructure_combined_GWAS.combined.Pvalue",header = T, sep = "\t")


ref_color <- rgb(252,170,27,max=255)
alt_color <- rgb(137,137,137,max=255)

CMplot(GWAS,plot.type = "m",
col=c(ref_color,alt_color),
chr.den.col=NULL,
band=0.5,
#pch=2,
LOG10 = TRUE,cex=0.5,
#ylim=c(0,500),
lwd.axis = 3, 
cex.axis = 2,
#ylab=""
#mar = c(3, 6, 3, 3),
width=24,height=6,
#highlight=peaks,highlight.type="h",
#highlight.col=c("red3"),
#highlight.cex=c(0.5),
#file = c("jpg")
)
