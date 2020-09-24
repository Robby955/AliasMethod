#Alias Method for sampling from a discrete distribution in R.

#The following example involved a discrete random probability that takes the value 1 with probability 0.2, 3 with probability 0.1,

#5 with probability 0.3, and so forth. To do for other random variables, replace p and Z with your custom choices.

p<-c(0.2,0.1,0.3,0.25,0.15) #initial probabilities corresponding to 1,3,5,7,9.

n=length(p)

U=n*p

Z<-c(1,3,5,7,9)

#Make Alias Structure

K<-rep(NA,n) #Our Alias vector that we wish to populate

Kind<-rep("False",n) #Our indicator for K vector which tells us which index is finalized

for(k in 1:n){
  
  if(U[k]==1 & Kind[k]=="False"){
    
    K[k]<-Z[k]
    
    Kind[k]="True" }
  
  for(i in 1:n){ for(j in 1:n){
    
    if(U[i]>1 & U[j]<1 & Kind[j]=="False"){ K[j]=Z[i] Kind[j]="True" U[i]=U[i]+U[j]-1 }
    
  }
  }
  
}

K

x<-runif(100,0,1)

t<-rep(0,100)

##Code for implelenting Alias Method

i=floor(n*x)+1

y=n*x+1-i

for(j in 1:100){ # for each j
  
  if(y[j] < U[i[j]]){ #if y is less than U
    
    t[j]=Z[i[j]] #then our random variable takes the value of i } if( y[j] > U[i[j]]){ #otherwise t[j]=K[i[j]] #it takes the value of the ith entry of our alias table.
    
    } }
    
