ExpressionProfileCorrelation=function(ExpressionValues,correlationType){
 # Function to calculate the correlation between expression profiles
 CorrelationValues=cor(ExpressionValues,use='complete.obs',method=correlationType) 
 
 # Plot a distribution of the correlation values
 CorrelationValues.m=melt(CorrelationValues)
 figure1=ggplot(CorrelationValues.m,aes(x=value))+geom_histogram(bindwidth=0.05,colour='black',fill='white')+labs(title='Histogram of correlation values')+theme_bw() 
 # create a correlation map
 figure2=ggplot(CorrelationValues.m,aes(x=Var1,y=Var2))+geom_raster(aes(fill=value))+scale_fill_gradient(low='white',high='red')+ theme(axis.text.x=element_blank(),axis.text.y=element_blank())+labs(title='Correlation map Gene-Gene',x='Genes',y='Genes')
 grid.arrange(figure1,figure2,nrow=1)
 
}