# 3. Multidimensional Data Structure in R

# 3.1 Vectors

# hierarchy
v_logical <- c(T,F,T)
is.vector(v_logical)
is.atomic(v_logical)
typeof(v_logical)

v_integer <- c(1L,2L,5L)
typeof(v_integer)

v_double <- c(1.3,2.1,5.0)
typeof(v_double)

v_mix <- c(T, 1L, 1.5, "a")
typeof(v_mix)
v_mix

#properties
v <- 1:3
v
length(v)
class(v)
names(v) <- c("one","two","three")
v
names(v)

#create vector and access elements and modify a vector

v <- c(1,3,5,8,0)
v
1:100
10:-10

seq(from = 1, to =100, by =1)
seq(from = 1, to =100, by =0.01)
seq(0, 10, length.out = 5)

v <- 1:5
names(v) <- c("a","b","c","d","e")
v
v[c(1,2,4)]
v[2:4]
v[5:1]
v[c(5,1,4)]
v[c(T,F,F,T,F)]

v
v[c("a","b")]


#modify elements
v[2] <- 20
v
v[c(1,2,4)] <-c(0,0,0)
v

v[v ==0]
v[v ==0] <- 1000
v

#truncate a vector
v <- v[1:3]
v

#transpose
t(v)

#delete
v <- NULL
v


V1 <- 1:3
V2 <- 100:105
V1
V2
V3 <-c(V1,V2)
V3

rep(x=v3, times = 3)
rep(10,10)

# Vector arithmetics

v<-1:5
a<-10
v
a
v+a
v-a
v/a
v*a
v^a
v %% a
sqrt(v)
log(v)

v1 <- seq(10,30,10)
v2 <- rep(3,3)
v1
v2

v1+v2
v1-v2
v1*v2

#vector matrix style multiplication 

v1 %*% v2 #vector multiplication

# recycling rule
v1 <- c(1,1,1)
v2 <- 1:6
v1
v2

v1+v2

#set operations
v1 <- c("a","b","c")
v2 <- c("c","d","e")

union(v1,v2)
intersect(v1,v2)
setdiff(v1,v2)

identical(v1,v2)
identical(1:3,1:3)

v1<-c(1,2,3)
v2<-c(3,2,1)
v2 %*% v1



# Working with Vectors
# Solution:
# 1) create a vector v1 with the values 1, 5, 10, 12, 20
v1 <- c(1, 5, 10, 12, 20)
# 2) create a vector v2 with the values 2, 2, 2, 2, 2 (if you know how to, you can use function rep() )
v2 <- rep(2,5)
# 3) now calculate the 3rd power of all elements of vector v1
v1^3
# 4) using vectors v1 and v2 execute the following vector arithmetics:
# v1 + 2*v2 + 20
v1 + 2*v2 + 20
# v1^4 / v2^2
v1^4 / v2^2

#Working with Matrices
M <- matrix(data = 1:9, nrow = 3, ncol =3)
M
M <- matrix(data = 1:9, nrow = 3, ncol =3, byrow=T)
M

v1 <- 1:3
v2 <- 4:6
v3 <- 7:9
rbind(v1,v2,v3)
cbind(v1,v2,v3)

v <- 1:9
v
dim(v) <- c(3,3)
v

#metric properties 

M <- matrix(data = 1:12, nrow = 4, dimnames = list(c("r1","r2","r3","r4"),c("c1","c2","c3")))
rownames(M)
colnames(M)
dim(M)
attributes(M)

class(M)
typeof(M)
is.matrix(M)


#access matrix elements
M

M[2,2] #single element
M[2,] #single row

M[c(T,T,F,F),c(T,T,T)]
M[c("r1"),c("c1","c2")]

#modify elements
M
M[2,2] <- 600
M
M[3:4,2:3] <-1000
M

M[M>500]
M[M>500]<-0
M

t(M)

#add row
rbind(M, c(1,2,3))
cbind(M, 10:13)

dim(M) <- c(3,4)
M

#merge 2 metrics
M1 <- matrix(data = rep(0,4), nrow = 2)
M2 <- matrix(data = rep(1,4), nrow = 2)
rbind(M1,M2)
cbind(M1,M2)

#metric arithmetic
M
a<-10

M+a
M-a
M/a
M*a
M**a
sqrt(M)

M
M1 <- M+0.5

M+M1
M-M1
M/M1
M*M1

M
M1<-t(M1)
M1
M%*%M1

M <- matrix(data = 1:9,nrow = 3)
M
diag(M)
det(M)
solve(M)

eigen(M)
M

rowSums(M)
colSums(M)

# matrix equation
# A * X = B
# X = inverse(A)*B
#inverse(A)-A^(-1)
A <- matrix(data = c(1,2,4,5), nrow =2, byrow=T)
B <- matrix(data = c(5,24,17,66), nrow =2, byrow=T)
A
B
X <- solve(A)%*%B
X
A %*% X
B

#apply aggregation
M
apply(X=M,MARGIN = 1, FUN = sum)
apply(X=M,MARGIN = 2, FUN = sum)

A <- rnorm(n = 1000, mean = 0, sd =2)
A <- matrix(data = rnorm(n = 1000, mean = 0, sd =2), nrow =100,ncol=10)
#mean values rows

apply(X = A, MARGIN = 1, FUN = mean)
apply(X = A, MARGIN = 2, FUN = mean)

M<- matrix(data=1:9,nrow=3,ncol=3,byrow=T)
M

# Working with Matrices
# Solution:
# Run this code to generate some random numbers:
rand_num <- runif(n = 100, min = 0, max = 1)
# 1) create matrix M using vector of random numbers, M must be square matrix with equal number of rows and columns!
nr_elements <- length(rand_num) # number of matrix elements
nr_rows <- sqrt(nr_elements) # number of rows for a square matrix
nr_cols <- nr_rows # equal number to rows
M <- matrix(data = rand_num, nrow = nr_rows, ncol = nr_cols, byrow = T) # create matrix
# 2) use adequate R function to count the number of rows and columns
dim(M)
# 3) now split matrix M into 4 smaller matrices M1, M2, M3, M4, when splitting all matrices must have unique elements from matrix M1
#    (when you split, do without using any matrix M element twice!!!)
M1 <- M[1:5,  1:5]
M2 <- M[1:5,  6:10]
M3 <- M[6:10, 1:5]
M4 <- M[6:10, 6:10]
# 4) calculate M1 + 2*M2 + M4^4 - M3
M1 + 2*M2 + M4^4 - M3


# 3.3 Array

#create array

A<-array(data=1:8,dim=c(2,2,2))
A
v1 <- c(2,9,6)
v2 <- c(10,15,13,16,11,12)
A <- array(c(v1,v2),dim=c(3,3,2))

M1 <- matrix(data=1:4,nrow=2)
M2 <- matrix(data=5:8,nrow=2)
A <- array(data = c(M1,M2,dim=c(2,2,2)))
A

#array property
row.names <- c("r1","r2")
col.names <- c("c1","c2")
matrix.names <- c("M1","M2")
A <- array(data = 1:8, dim = c(2,2,2), dimnames = list(row.names, col.names, matrix.names))
A
attributes(A)

#access elements

A[2,2,1]
A[,,1]
A["r1","c1","M2"]
A[1:2,1:2,2]

#Modify elements
A[1,1,1] <- 1000
A
A[,,1]<- matrix(data = rep(0,4), nrow =2)
A

#apply aggregation using apply
A<-array(data = 1:8, dim = c(2,2,2))
A

apply(A,1,sum)
apply(A,2,sum)
apply(A,3,sum)

A <- array(data=1:16, dim =c(2,2,2,2))

# Solution:

# Use R to execute the steps given below:
# 1) create 3 different vectors (v1, v2, v3), you can choose the values and dimensions of each vector,
#    (the only condition is that all three vectors have the same dimension)
v1 <- 1:16
v2 <- 17:32
v3 <- 33:48

# 2) from each vector (v1, v2, v3) create a matrix (M1, M2, M3)
#	 (the only coddition is that all three matrices have the same dimension)
M1 <- matrix(data = v1, nrow = 4, ncol = 4, byrow = T)
M2 <- matrix(data = v2, nrow = 4, ncol = 4, byrow = T)
M3 <- matrix(data = v3, nrow = 4, ncol = 4, byrow = T)


# 3) now create an array A by merging all three matrices (M1, M2, M3)
#    (matrices are merged together on thirs dimension!!!)
A <- array(data = c(M1, M2, M3), dim = c(4, 4, 3))

# 4) use apply() and sum() to calculate total sum of rows and columns of created array A
apply(A, MARGIN = 1, FUN = sum)
apply(A, MARGIN = 2, FUN = sum)


# 3.4 Lists

#create a list
a <- 10
b <- 2L
c <- T
d <- "word"
v <-1:10
M <- matrix(data= seq(10,40,10), nrow =2)
A <- array(data=1:8,dim=c(2,2,2))

lst <- list(a,b,c,d,v,M,A)
lst

str(lst)
typeof(lst)
class(lst)
is.list(lst)

#names element
names(lst) <- c("a","b","c","d","v","M")


#access elements of a list
#single brackets [] (return a list)
lst1 <- lst[1]
class(lst1)

lst123 <- lst[1:3]
lst123


#double brackets [[]] (original class returned)
ele<-lst[[1]]
class(ele)

# $sign
ele <- lst$M
ele
class(ele)




# Working with Lists

# Solution:

# 1) Create 3 different object types, one is vector data type other two types are of your choosing.
v <- 1:10
l <- TRUE
i <- 5L

# 2) Now create a list L and store all three objects you have already created.
#    (name of objects inside a list should be the same as original object names)
L <- list(v = v, l = l, i = i)

# 3) Now extract one vector from a list L:
#    a) extract it as a member (to get a vector type)
#    a) extract it as a list (sub-list of a list L)
L[1]
L[[1]]

# 4) Store both extractions into different objects, and check their types with typeof()
v.list <- L[1]
v.vec <- L[[1]]
typeof(v.list)
typeof(v.vec)


# modify a list

lst
lst[1] <- NULL

length(lst)
lst[7] <-1000

lst[length(lst)+1] <- "string"
lst

lst[[7]]<-500
lst

lst[[4]]
lst[[4]][5]
lst[[4]][5] <- 500
lst[[4]]

# unlist a list
unlist(lst)
class(unlist(lst))
is.vector(lst)


#merging lists together
lst1 <- list(el1 =c(1,5,10),el1=T)
lst_merged <- c(lst, lst1)
str(lst_merged)
names(lst_merged)

list3 <- list(1,c(T,F,F)) #list sub-level 3
list2 <- list(list3) #list sub-level 2
list1 <- list(list2) #list sub-level 1

str(list1)
list1[[1]]
list1[[1]][[1]]
list1[[1]][[1]][[1]]
list1[[1]][[1]][1]

v<-c("a","b","l","g")
print(v[3])

v1<- c(1,2,3)
v2<- 1:5
v1+v2

apply(M,2,mean)


v1<-rep(1,4)
v2<-c(1,2,3,4)
v1%*%v2

v<-1:10
v[seq(2,length(v),2)] <- v[seq(2,length(v),2)]*5
v[seq(1,(length(v) -1),2)] <- v[seq(1,(length(v) -1),2)]*10
a<- v[9]-v[10]-v[8]
print(a)

v1 <- rep(0,5)
v2 <- seq(from=2,to=10,by=2)
result <- ((v2^2) %*% v1) +sqrt(9)
result


v1<-rep(10,100)
v2<-v1
v2[seq(1,99,2)] <- v2[seq(1,99,2)]/5
v2[seq(2,100,2)] <- v2[seq(2,100,2)]/10
M<- matrix(data=v2,nrow=10,ncol=10,byrow=T)
print(diag(M)[1:5])



v<-runif(n=1000,min=0,max=1)
M<-matrix(data=v,nrow=50,ncol=200)
A<-array(data=M,dim=rep(10,3))
O1<- A[,,sqrt(9)]
O2<- A[,,4]
O3<- A[,,50%/%10]
O<-rbind(O1,O2,O3)
print(dim(O))
