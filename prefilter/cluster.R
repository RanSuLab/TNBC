net = blockwiseModules(datExpr,power = sft$powerEstimate, maxBlockSize = 7000,
                       TOMType = "unsigned", deepSplit =3 ,minModuleSize =40,
                       reassignThreshold = 0, mergeCutHeight =0.35
                       ,
                       numericLabels = TRUE, pamRespectsDendro = FALSE,
                       saveTOMs = TRUE,
                       saveTOMFileBase = "FPKM-TOM",
                       verbose = 3)

table(net$colors)
mergedColors = labels2colors(net$colors)
# Plot the dendrogram and the module colors underneath
plotDendroAndColors(net$dendrograms[[1]], mergedColors[net$blockGenes[[1]]],
                    groupLabels = c("Module colors", 
                                    "GS.weight"),
                    dendroLabels = FALSE, hang = 0.03,
                    addGuide = TRUE, guideHang = 0.05)

MEs = net$MEs 
 
MEs_col = MEs 
colnames(MEs_col) = paste0("ME", labels2colors( 
  as.numeric(str_replace_all(colnames(MEs),"ME","")))) 

MEs_col = orderMEs(MEs_col) 

plotEigengeneNetworks(MEs_col, NULL, marDendro = c(2,4,4,4), marHeatmap = c(3,3,2,3), 
                      plotDendrograms = T, xLabelsAngle = 90)


             


