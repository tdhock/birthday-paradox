num.ouvres <- 1:400
prob.tous.différents <- sapply(num.ouvres, function(N)prod(seq(80640, 80640-N+1)/80640))
png("figure-œuvres.png", width=6, height=5, units="in", res=200)
plot(num.ouvres,prob.tous.différents)
premier.diff <- which(prob.tous.différents<0.5)[1]
points(num.ouvres[premier.diff], prob.tous.différents[premier.diff], col="red", pch=20)
text(num.ouvres[premier.diff], prob.tous.différents[premier.diff], sprintf("ouvres=%d\nprob=%.3f",num.ouvres[premier.diff], prob.tous.différents[premier.diff]), col="red", adj=c(1,1.5))
title("combien d’œuvres pour avoir une probabilité plus forte ?")
dev.off()
