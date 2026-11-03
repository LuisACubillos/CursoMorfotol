efourier<-function(M, n=dim(M)[1]/2)
 {p<-dim(M)[1]
 Dx<-M[,1]-M[c(p,(1:p-1)),1]
 Dy<-M[,2]-M[c(p,(1:p-1)),2]
 Dt<-sqrt(Dx^2+Dy^2)
 t1<-cumsum(Dt)
 t1m1<-c(0, t1[-p])
 T<-sum(Dt)
 an<-bn<-cn<-dn<-numeric(n)
 for (i in 1:n){
    an[i]<- (T/(2*pi^2*i^2))*sum((Dx/Dt)*(cos(2*i*pi*t1/T)-cos(2*pi*i*t1m1/T)))
    bn[i]<- (T/(2*pi^2*i^2))*sum((Dx/Dt)*(sin(2*i*pi*t1/T)-sin(2*pi*i*t1m1/T)))
    cn[i]<- (T/(2*pi^2*i^2))*sum((Dy/Dt)*(cos(2*i*pi*t1/T)-cos(2*pi*i*t1m1/T)))
    dn[i]<- (T/(2*pi^2*i^2))*sum((Dy/Dt)*(sin(2*i*pi*t1/T)-sin(2*pi*i*t1m1/T)))}
 ao<-2*sum(M[,1]*Dt/T)
 co<-2*sum(M[,2]*Dt/T)
 list(ao=ao,co=co,an=an,bn=bn,cn=cn,dn=dn)}
####f5.9
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
