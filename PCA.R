#Principle Component Analysis

rm(list=ls())
setwd("~/Desktop")

tiff(filename = "PCA.tiff", 
     width = 4096, height = 2304, units = "px",
     res = 400, pointsize = 4 )


#load data
Breast.dat = read.csv("/Users/johnsonfong/Desktop/R/PCAdata.csv", header = TRUE, row.names = 1)

# log transform 
log.breast <- (Breast.dat[, 2:20]) ###### CHANGE THIS TO THE NUMBER OF CYTOKINES+1
breast.subtypes <- Breast.dat[, 1]

# apply PCA - scale. = TRUE is highly 
# advisable, but default is FALSE. 
breast.pca <- prcomp(log.breast,
                 center = TRUE,
                 scale. = TRUE) 

# print method
print(breast.pca)
# plot method
## plot(breast.pca, type = "l")
# summary method
summary(breast.pca)

library(devtools)


library(ggbiplot)
g <- ggbiplot(breast.pca, obs.scale = 1, var.scale = 1, 
              groups = breast.subtypes, ellipse = TRUE, ellipse.prob = .8, 
              circle = FALSE,
              #labels = rownames(Breast.dat),labels.size = 2.2, #Patient labels
              var.axes=T, #Vectors for cytokines
              )
g <- g + scale_color_discrete(name = '')
g <- g + theme_classic()
g <- g + theme(legend.direction = 'horizontal', 
               legend.position = 'top')

print(g)

dev.off() 
