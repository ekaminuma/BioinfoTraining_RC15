kmeansAICBIC = function(fit){

m = ncol(fit$centers)
n = length(fit$cluster)
k = nrow(fit$centers)
D = fit$tot.withinss
return(data.frame(AIC = D + 2*m*k,BIC = D + log(n)*m*k))

}
