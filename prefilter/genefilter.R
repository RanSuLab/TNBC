library("lattice")
suppressPackageStartupMessages(library("ggplot2"))
library("ggplot2")
library("caret")
library("dynamicTreeCut")
library("fastcluster")
library("WGCNA")
library("stringr")

source("function.R")
set.seed(123)
options(stringsAsFactors = FALSE)
enableWGCNAThreads()
corType = "pearson" 
type = "unsigned"
robustY = ifelse(corType=="pearson",T,F)


kuo<-read.csv("xx.csv",header=T)
datExpr<-kuo  


source("pickSoftThreshold.R")
source("cluster.R")
source("Eigengene cluster.R")
source("relation.R")


class<-read.csv('class.txt',sep = '\t')
expression<-cbind(datExpr,class)
expression$class<-factor(expression$class)
folds<-createFolds(y=expression$class,k=10)

data<-getdata(expression)
train<-data[[1]]    
test<-data[[2]]

module = c("black","blue","brown","greenyellow","grey","pink","purple","yellow")#这两个模块和亚型相关度最大
inModule<-selecte_genes(module)
train2<-deltrain(train)

tryy<-train2
for (i in 1:10){
  train2[[i]]<-cbind(train2[[i]],train[[i]][,2391])
  colnames(train2[[i]])[1392]<-'class'}