# Load the biomaRt package
library(biomaRt)
library(xlsx)

# set the working directory
workingDir = "C:/Users/tim.kuijpers/Dropbox/Universiteit Maastricht/TGX/EGM Analysis";
setwd(workingDir); 
options(stringsAsFactors = FALSE);

# connect to the biomaRt database
ensembl=useMart('ensembl')
# check and select which datasets are available
listDatasets(ensembl)
# select the dataset
ensembl=useDataset('hsapiens_gene_ensembl',mart=ensembl)

# show the available filters in the selected dataset
filters=listFilters(ensembl)
# show the attributes in the selected dataset
attr=listAttributes(ensembl)

# load the dataset ( which has the colums ensembl ID, entrezID, gene name and correlation)
data=read.table('GenesandCpGInCoModule1.txt',sep='\t')
# divide in low and high expressed genes
#data_low=data.frame(data$V1,data$V2,data$V3)
#data_high=data.frame(data$V4,data$V5,data$V6)


# run the query
#gc_low=getBM(attributes=c('ensembl_gene_id','entrezgene',"external_gene_name",'name_1006','namespace_1003','hgnc_transcript_name'),filters='hgnc_transcript_name',values=data_low$data.V1,mart=ensembl)
#gc_high=getBM(attributes=c('ensembl_gene_id','entrezgene',"external_gene_name",'name_1006','namespace_1003','hgnc_transcript_name'),filters='hgnc_transcript_name',values=data_high$data.V4,mart=ensembl)
DataContent=getBM(attributes=c('ensembl_gene_id','entrezgene',"external_gene_name",'name_1006','namespace_1003'),filters='hgnc_symbol',values=data$V1,mart=ensembl)
DataContent_biologicalfunctions=subset(DataContent,DataContent$namespace_1003 =='biological_process')
DataContent_MolecularFunction=subset(DataContent,DataContent$namespace_1003 =='molecular_function')

write.xlsx(DataContent_biologicalfunctions,'Genes_BiologicalFunctions.xlsx')
write.xlsx(DataContent_MolecularFunction,'DataContent_MolecularFunction.xlsx')

