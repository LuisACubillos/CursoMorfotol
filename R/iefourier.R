iefourier<-function(an,bn,cn,dn,k,n,ao=0,co=0)
 {theta<-seq(0,2*pi, length=n+1)[-(n+1)]
 harmx <- matrix (NA, k, n)
 harmy <- matrix (NA, k, n)
 for (i in 1:k){
 harmx[i,]<-an[i]*cos(i*theta)+bn[i]*sin(i*theta)
 harmy[i,]<-cn[i]*cos(i*theta)+dn[i]*sin(i*theta)}
 x<-(ao/2) + apply(harmx, 2, sum)
 y<-(co/2) + apply(harmy, 2, sum)
 list(x=x, y=y)}
