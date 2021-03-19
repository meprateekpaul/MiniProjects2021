#Getting Started (script headline)
#7th March 2021
x <- 1 #assign variables
y <- 2
z <- x+y
print(z)

#Basic Functions

help("sum")
example("sum")
c(1,2,5,10)
help("seq")

seq(from=10, to=50, by=2)

rep(1,10)


sum(c(1,2,3))
mean(seq(3,20,4))
max(seq(3,20,4))
min(seq(3,20,4))
sd(seq(3,20,4))
var(seq(3,20,4))

data(mtcars)
help(mtcars)
rm(mtcars)
Sys.getenv()

Sys.Date()
Sys.time()
Sys.timezone()

sum(45,321)
23-9
3*5/2
121%%22
12**4
17**3-15**3
5+2-3*4/2%%4**3

a<-10
v<-1:5
data(mtcars)
data("iris")

save(list = "a", file = "a.RData")
rm(a)
load(file = "a.RData")

ls()
objects <- ls()
objects

save(list = objects, file = "workspace.RData")
rm(list =ls())

load(file = "workspace.RData")

a <-100
b <- 200
c<-a/5
print(a*b/c)
print((a*10)%/%70)

x <- 10
y <- 8
z <- 3
result <- (x-y)^z
print(result)

v1 <- c(6,5,10,4)
v2 <- v1 %/% 3
print(v2)

print(6/3+10-3)
print(3*2+6-4)
print(3*3+6-3)
print(3*2+6-2)
