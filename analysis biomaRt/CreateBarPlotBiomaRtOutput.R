##########################################################
############## Create barplot from biomaRt output ########
##########################################################

# settings 
workingDir=('C:/Users/tim.kuijpers/Dropbox/Universiteit Maastricht/TGX/EGM Analysis')
setwd(workingDir)
library(ggplot2)
library(xlsx)

# Load the different datasets
GenesBiologicalInformation=read.xlsx('Genes_BiologicalFunctions.xlsx',1)
GenesMolecularFunction=read.xlsx('DataContent_MolecularFunction.xlsx',1)

# Create a table with the frequency
tableBiologicalFunctions=as.data.frame(table(GenesBiologicalInformation$name_1006))
tableMolecularFunctions=as.data.frame(table(GenesMolecularFunction$name_1006))
# sort by frequency
tableBiologicalFunctions=tableBiologicalFunctions[order(-tableBiologicalFunctions$Freq),]
tableMolecularFunctions=tableMolecularFunctions[order(-tableMolecularFunctions$Freq),]

# use the ggplot2 barplot function  (Take the top 10 processes)
jpeg('BarplotBiologicalFunctions.jpeg')
ggplot(tableBiologicalFunctions[1:10,],aes(Var1,Freq))+geom_bar(stat='identity',fill='blue')+geom_text(aes(label=Freq), vjust=1.6, color="white",position = position_dodge(0.9), size=3.5)+theme(axis.text.x = element_text(angle = 90, hjust = 1))
dev.off()
jpeg('BarplotMolecularFunctions.jpeg')
ggplot(tableMolecularFunctions[1:10,],aes(Var1,Freq))+geom_bar(stat='identity',fill='blue')+geom_text(aes(label=Freq), vjust=1.6, color="white",position = position_dodge(0.9), size=3.5)+theme(axis.text.x = element_text(angle = 90, hjust = 1))
dev.off()