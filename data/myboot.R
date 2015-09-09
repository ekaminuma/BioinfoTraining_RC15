myboot <- function (d,label,iter){
	bootres = c()
	for(i in 1:iter){
		indices=sample(1:nrow(d),floor((2*nrow(d))/3))
		res=corPred(d,label,indices)
		bootres=c(bootres,res)
	}
	
	BOOT.RES <- bootres
	BOOT.MEAN <-  mean(bootres)
	BOOT.SD <- sd(bootres)
	return(list(BOOT.RES, BOOT.MEAN, BOOT.SD))
	
}