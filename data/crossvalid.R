k=10
index<-sample(1:k,nrow(myData),replace=TRUE)
folds <- 1:k
myRes <- data.frame()
for (i in 1:k){
	training= subset(myData,index %in% folds[-i])
	test = subset(myData,index %in% c(i))
	
	mymodel = svm(training$Species~., data=training) #モデル学習
	
	actual = test[,ncol(test)]
	temp=data.frame(predict(mymodel,test[,-ncol(test)])) #予測
	colnames(temp) = "Predicted"
	results = data.frame(Predicted=temp, Actual=actual)
	myRes= rbind(myRes,results) #データ追加
}
