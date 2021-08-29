setwd("C:\\0Analysis_Research\\walnut_genome_project\\3_population_structure\\Final_860samples\\Final_SNPRelate\\plot_PCAinfo")


pdf(file= "Final_Grouped_PCAinfo1-2.pdf",7,6)
#pdf(file= "Grouped_PCAinfo_1-3.pdf",6,6)
#pdf(file= "Grouped_PCAinfo_2-3.pdf",6,6)

library(ggplot2)
library(grid)
library(gridExtra)
library(ggfortify)


data <- read.table("combined_info_for_PCAplot",sep="\t",header=TRUE)

PC1 <- data$PC1
PC2 <- data$PC2
PC3 <- data$PC3


color <- as.character(data$color)
type <- data$type




#dev.off()


#data$color
plot <- ggplot(data,aes(x=PC1,y=PC2)) + 
#plot <- ggplot(data,aes(x=PC1,y=PC3)) +
#plot <- ggplot(data,aes(x=PC2,y=PC3)) + 
# geom_density_2d() +
geom_point(color = color, fill = color, size = 2,alpha = 1/2) + 
#geom_point(color = "black", fill = "black", size = 3,alpha = 1/2) + 
#ggplot(data2,aes(x=xpoints ,y=xpoints )) +
#geom_point(aes(x=xpoints,y=ypoints),data2,color = data2$color, fill = color, size = 2,alpha = 1/2) + 


theme_bw() +
theme(legend.position = "right") +
scale_x_continuous(
  limits = c(-0.05,0.15)
)+
scale_y_continuous(
  limits = c(-0.05,0.07)
)+
#scale_x_continuous(
#  limits = c(-0.05,0.08)
#)+
#scale_y_continuous(
#  limits = c(-0.09,0.075)
#)+
xlab("Eigenvector 1") +
ylab("Eigenvector 2") +
  theme(axis.text = element_text(size = 16),axis.title=element_text(size=16))



plot 

dev.off()





