traitData <- read.csv(file="xingzhuang.csv",  header=T)

sampleName = rownames(datExpr) 
traitData = traitData[match(sampleName, rownames(traitData)), ] 


if (corType=="pearsoon") { 
  modTraitCor = cor(MEs_col, traitData, use = "p") 
  modTraitP = corPvalueStudent(modTraitCor, nSamples)
}else { 
  modTraitCorP = bicorAndPvalue(MEs_col, traitData, robustY=robustY) 
  modTraitCor = modTraitCorP$bicor 
  modTraitP = modTraitCorP$p}


textMatrix = paste(signif(modTraitCor, 2))
dim(textMatrix) = dim(modTraitCor)
sizeGrWindow(10,6)
par(mar=c(4,15,2,2))
labeledHeatmap(Matrix = modTraitCor, xLabels = colnames(traitData), 
               yLabels = colnames(MEs_col), cex.lab = 1.5,ySymbols = colnames(MEs_col), 
               colorLabels = FALSE, colors = blueWhiteRed(50), textMatrix = textMatrix, 
              setStdMargins = FALSE, cex.text =1.5, zlim = c(-1,1))