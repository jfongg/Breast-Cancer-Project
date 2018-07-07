### HEATMAP ###
rm(list=ls())
setwd("~/Desktop") 
library(gplots)
library(dendextend)

tiff(filename = "heatmap1.tiff", 
     width = 2304, height = 2304, units = "px",
     res = 600, pointsize = 4.5 )

Breast.dat = read.csv("/Users/johnsonfong/Desktop/heatmap.csv", 
                      header = TRUE, row.names = 1)

#Rowv  <- Breast.dat %>% dist %>% hclust %>% as.dendrogram %>%
#  set("branches_k_color", k = 5) %>% set("branches_lwd", 4) %>%
#  ladderize

h = heatmap.2(as.matrix(Breast.dat), 
          distfun=function(x) dist(x,method="euclidean"), 
          hclustfun = function(x) hclust(x,method = "ward.D2"),
          col=greenred(75), scale="none", key=T, keysize=1.0,
          density.info="density", trace="none",cexCol=0.9, smykey= FALSE, 
          #rowsep = c(15,18,32,52), ### draws a white line for clusters 
                #(26,34,49,73) = {19}WithNormals
                #(16,30,42,57) = {19}NoNormals
          xlab= "Cytokines & Chemokines", ylab="Patients")

          
      #    RowSideColors = c(    # grouping row-variables into different
      #      rep("mediumblue", 14),   # Count of ER/HER2+
      #      rep("green4", 37),       # Count of ER+
      #      rep("red2", 9),          # Count of HER+
      #      rep("whitesmoke", 19),    # Count of Normals
      #      rep("yellow2", 12)),     # Count of Triple Neg
)
      #    par(lend = 1)           # square line ends for the color legend
      #    legend("topright",      # location of the legend on the heatmap plot
      #         legend = c("ER+", "HER2+", "ER/HER2+","TripNeg","Normal"), # category labels
      #           col = c("green4", "red2", "mediumblue","yellow2","whitesmoke"),  # color key
      #           lty= 1,             # line style
      #           lwd = 9            # line width
          
          
#)

dev.off() 

SIDorder = rownames(Breast.dat)[h$rowInd] #Bottom to top
write.csv(SIDorder, file = "Heatmap SIDorder.csv")

