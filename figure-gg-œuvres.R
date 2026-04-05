library(data.table)
library(ggplot2)
num.possible <- 80640
plus.colors <- c(
  "tous différents"="blue",
  "deux pareils"="red",
  zéro="black")
prob.dt <- data.table(num.œuvres=1:num.possible)[
, num.i := num.possible-num.œuvres+1
][
, prob.i := num.i/num.possible
][
, log.prob.i := log(prob.i)
][, let(
  cumsum = exp(cumsum(log.prob.i)),
  cumprod = cumprod(prob.i)
)][, let(
  diff = cumsum-cumprod,
  plus.probable = factor(fcase(
    cumprod==0, "zéro",
    cumprod<0.5, "deux pareils",
    default="tous différents"),
    names(plus.colors))
)][]
prob.dt[order(abs(diff))]
text.dt <- rbind(
  prob.dt[plus.probable=="deux pareils"][1],
  prob.dt[num.œuvres==102])
## https://en.wikipedia.org/wiki/Birthday_problem#Arbitrary_number_of_days says we can use
sqrt(2*num.possible*log(2))
(gg <- ggplot()+
  ggtitle("combien d’œuvres pour avoir une probabilité plus forte ?")+
   scale_color_manual(values=plus.colors)+
   ylab("probabilité que tous les œuvres sont différents")+
  geom_point(aes(
    num.œuvres, cumprod, color=plus.probable),
    data=text.dt)+    
  geom_text(aes(
    num.œuvres, cumprod, color=plus.probable,
    label=sprintf(" œuvres=%d prob=%.3f", num.œuvres, cumprod)),
    vjust=-0.5,
    hjust=0,
    data=text.dt)+    
  geom_line(aes(
    num.œuvres, cumprod, color=plus.probable),
    data=prob.dt))

(logx <- gg+scale_x_log10())

(logxy <- logx+scale_y_log10())

png("figure-gg-œuvres.png", width=6, height=4, units="in", res=200)
print(logx)
dev.off()

