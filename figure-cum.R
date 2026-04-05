library(data.table)

(expr.list <- atime::atime_grid(
  list(value=c(0.9, 0.1, 0)),
  cumprod=data.table(first.zero=which(0==cumprod(rep(value, N)))[1])))
alist <- atime::atime(
  expr.list=expr.list,
  seconds.limit=0.1,
  result=TRUE)
plot(alist)

png("figure-cum.png", width=5, height=6, units="in", res=200)
plot(alist)
dev.off()

