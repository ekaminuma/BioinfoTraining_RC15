
source("kmeansAICBIC.R")

mydata <- read.csv("yeast.csv",header=F) 
dat1 <- mydata[,2:9] 

xx <- seq(1,8)
out <- matrix(0,8,2)

for (kk in 1:8) {            
  kmx.kk <- kmeans(dat1,xx[kk]) 
  tmp <- kmeansAICBIC(kmx.kk)  
  out[kk,1] <- tmp$AIC
  out[kk,2] <- tmp$BIC
}                             

aic <- out[,1]
cluster_num <- which(aic == min(aic))
write.table(cluster_num, "tmpAICnum.txt", quote=F, col.names=F, append=F)


png("tmpAIC.png",  width = 480, height = 240, units = "px", pointsize = 12)
par(mfrow=c(1,2))
plot(xx,out[,1],ps = 12,main="AIC",xlab="cluster number",ylab="AIC")
plot(xx,out[,2],ps = 12,main="BIC",xlab="cluster number",ylab="BIC")
dev.off()   

write.table(out, "tmpAICBIC.txt", quote=F, col.names=F, append=F)
             

 