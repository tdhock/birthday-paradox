library(data.table)

alist <- atime::atime(
  cumprod={
    which(cumprod((N-(1:N)+1)/N)<0.5)[1]
  },
  ## https://en.wikipedia.org/wiki/Birthday_problem#Arbitrary_number_of_days says we can use
  wiki=ceiling(sqrt(2*N*log(2))+(3-2*log(2))/6+(9-4*log(2)^2)/(72*sqrt(2*N*log(2)))),
  result=function(x)data.table(min.int=x))
plot(alist)

png("figure-coincidence.png", width=6, height=6, units="in", res=200)
plot(alist)
dev.off()

fun.list <- list(
  "1"=function(N)1,
  "sqrt(N)"=function(N)0.5*log10(N),
  N=function(N)log10(N),
  "N^2"=function(N)2*log10(N))
aref <- atime::references_best(alist, fun.list)
plot(aref)

png("figure-coincidence-ref.png", width=6, height=6, units="in", res=200)
plot(aref)
dev.off()

