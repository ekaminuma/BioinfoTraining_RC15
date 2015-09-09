
mydata <- read.csv("yeast.csv",header=F)
yeast50 <- mydata[1:50,2:9]

hclustfunc <- function(x) hclust(x, method="ave")
distfunc <- function(x) dist(x,method = "euclidean", diag = FALSE, upper = FALSE)
d <- distfunc(yeast50)
hc <- hclustfunc(d)

groups <- cutree(hc, k=4)

png("fig_hc_yeast50_ave.png", width=480, height=240, units="px",pointsize=12)
plot(hc, hang <- -1, labels = groups)
rect.hclust(hc, k=4, which = NULL, x=NULL, h=NULL, border=2, cluster=NULL)
dev.off()
