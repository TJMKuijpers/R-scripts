###################### Initialization of H matrix based on clustering ############

# load the dataset
load('J:/FHML_TGX/Tim.Kuijpers/Project EGM data analysis/Data from NGS-Calc/Combine NMF features/Data/FullDataSetForNMF.RData')
# Subset for the MetaData
MetaData=FullData[1:19,]
# Construct data frame of PCB,HCB,DDE exposure data
PCBExposure=MetaData[11:18,]
PCBExposure=t(PCBExposure)
# Perform hierarchical clustering
clusters=hclust(dist(PCBExposure))
plot(clusters)

# Cut the tree to get the number of clusters
k=3
ClusterCut=cutree(clusters,k)
# Construct a matrix out of the ClusterCut object
Hinitialized=matrix(0,k,dim(FullData)[2])
Hinitialized=Hinitialized+0.4
colnames(Hinitialized)=colnames(FullData)
for(x in 1:k){
     # go through each cluster value
     values=which(ClusterCut==x)
     print(values)
	if(length(values)!=0){
        for(y in 1:length(values)){
        Hinitialized[k,values[y]]=1}}
}
