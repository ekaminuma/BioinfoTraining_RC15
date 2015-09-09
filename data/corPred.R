corPred <- function(data,label,indices){
	train<-myData[indices,]
	test<-myData[-indices,]
	testClass<-test[,label]
	
	colnames(train)[ncol(train)]="Class" 
	
	mySVM = svm(Class~., data=train, cost=100, gamma=1)
	myPred = predict(mySVM, test)
	TP=sum(myPred == testClass)
	return(TP)
}
