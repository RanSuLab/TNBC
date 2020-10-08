getdata<-function(expression){
  train<-list() #构建列表
  test<-list()
  for(i in 1:10) {
    train[[i]]=expression[-folds[[i]],];#循环十折中的每一折。一折对应一组测试集，所有样本中去除测试集的部分为训练集
    test[[i]]=expression[folds[[i]],];
  }
  data<-list(train,test)#data中应该包含2个大元素，每个元素里面有十个小元素
  return(data)
}

selecte_genes<-function(v){
  module =v
  inModule1 = (mergedColors==module[1])
  inModule2 = (mergedColors==module[2])
  inModule3 = (mergedColors==module[3])
  inModule4 = (mergedColors==module[4])
  inModule5 = (mergedColors==module[5])
  inModule6 = (mergedColors==module[6])
  inModule7 = (mergedColors==module[7])
  inModule8 = (mergedColors==module[8])
 
  inModule=vector()
  for(i in 1:length(inModule1)){
    if(inModule1[i]==TRUE || inModule2[i]==TRUE ||inModule3[i]==TRUE||inModule4[i]==TRUE||inModule5[i]==TRUE||inModule6[i]==TRUE||inModule7[i]==TRUE||inModule8[i]==TRUE)
      inModule[i]=TRUE
    else
      inModule[i]=FALSE
    
  }
  
  return(inModule) 
}

deltrain<-function(train){
  train2<-list()
  for(i in 1:10){
    temp<-train[[i]]
    train2[[i]]<-temp[,inModule]
    
  }
  return(train2)
}
