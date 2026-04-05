library(data.table)

combinations <- 80640
alist <- atime::atime(
  N=10^seq(1, 4.5, by=0.1),
  sapply=sapply(1:N, function(n)prod(seq(combinations, combinations-n+1)/combinations)),
  pkg=cumprod::cumprod_interface((combinations-(1:N)+1)/combinations),
  cumprod=cumprod((combinations-(1:N)+1)/combinations),
  cumsum=exp(cumsum(log((combinations-(1:N)+1)/combinations))),
  result=TRUE)
dcast(
  alist$measurements, N ~ expr.name, value.var="result"
)[, equal := all.equal(sapply[[1]], cumprod[[1]]), by=N][]
png("figure-atime.png", width=4, height=6, units="in", res=200)
plot(alist)
dev.off()

aref <- atime::references_best(alist)
plot(aref)

alist <- atime::atime(
  sapply=sapply(1:N, function(n)prod(seq(N, N-n+1)/N)),
  pkg=cumprod::cumprod_interface((N-(1:N)+1)/N),
  cumprod=cumprod((N-(1:N)+1)/N),
  cumsum=exp(cumsum(log((N-(1:N)+1)/N))),
  result=TRUE)
dcast(
  alist$measurements, N ~ expr.name, value.var="result"
)[, equal := all.equal(sapply[[1]], cumprod[[1]]), by=N][]
plot(alist)

aref <- atime::references_best(alist)
plot(aref)


Nexp <- 6
combinations <- 10^Nexp
alist <- atime::atime(
  N=10^seq(1, Nexp, by=0.1),
  sapply=sapply(1:N, function(n)prod(seq(combinations, combinations-n+1)/combinations)),
  pkg=cumprod::cumprod_interface((combinations-(1:N)+1)/combinations),
  cumprod=cumprod((combinations-(1:N)+1)/combinations),
  cumsum=exp(cumsum(log((combinations-(1:N)+1)/combinations))),
  result=TRUE)
plot(alist)
png("figure-atime-large.png", width=4, height=6, units="in", res=200)
plot(alist)
dev.off()

