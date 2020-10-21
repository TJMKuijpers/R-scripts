##################################################################################
###### Script to create a Gene - DNA methylation - Disease - Compound Network ####
##################################################################################

# Author: T.J.M. Kuijpers
# Databases used:
# Disease - Gene associations: DisGeneNet
# Compound - Gene associations: CTD
# Gene - Gene interactions:
# CpG - Gene interactions: File provided by Illumnia

# Design of data base: 
# DataFrame: Interactor A ; Interactor B ; Interaction Type ; miscellaneous

# Read the gene-gene interactions

# Read CpG - Gene interactions
CpGGeneDatabase=read.delim()

# Read Compound - Gene interactions
CompoundGeneDatabase=read.delim()

# Read disease- gene interactions

CpGGeneInteractions=data.frame('Interactor A'=,'Interactor B'=,'Interaction type'=,'Miscellaneous'=)
