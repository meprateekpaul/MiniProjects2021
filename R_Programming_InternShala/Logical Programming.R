# Logical statements

# if statements

# if statement

x <- 3
y <- 14

if(x < y){
  print("x is less than y")
}


# if-else statement

x <- 3
y <- 14

if(x > y){
  print("x is greater than y")
} else{
  print("x is less or equal to y")
}

# if-else if-else statement

x <- 14
y <- 14

if(x > y){
  print("x is greater than y")
} else if (x < y){
  print("x is less than y")
} else{
  print("x is equal to y")
}


# relational operators

# scalar
x <- 3

x == 4
x > 0 
x < 5
x <= 3
x >= 10
x %in% c(1,2,3,4,5)

# vectors
X <- c(F,T,0,10)
Y <- c(T,F,F,T)

X == Y # element-wise comparison
X > Y
X < Y
X >= Y
X <= Y
X != Y
X %in% Y


# Logical operators 

X | Y
X || Y
X & Y
X && Y
!X

# logical operators in if statement (flip coin twice)
c1 <- "H"
c2 <- "H"

if(c1 == "H" & c2 == "H"){
  paste("You win 10$")
} else if((c1 == "H" & c2 == "T") | (c1 == "T" & c2 == "H")){
  paste("You win 2$")
} else{
  paste("You lose all the money")
}

# Code challenge
# Module 5: Programming
# Logical statements

# Solution:

# The idea here:
# - we would like to write an R program that will enable user to write the user's name (using R input)
# - the program checks the length of the name (number of letters, white space is counted as 1 letter!)
# - the program should paste text:
#      - "short name" if the name has between 1 and 3 letters
#      - "medium name" if the name has between 4 and 11 letters
#      - "long name" if the name has over 12 letters

# the code - just fill the parts when instructed
#   line # 3 #: condition is missing for short names (hint: relational operator & a value)
#   line # 5 #: logical operator is missing between two conditions (hint: choose between AND or OR operators, but use R syntax!)
#   line # 7 #: syntax for logical statement is missing (hint: you must include "if" or "else if" or "else")


# ---------  R program --------- #
my.name <- readline(prompt="Enter name: ")# when run takes user's input 

if(nchar(my.name) <= 3){
  paste("short name")
} else if(nchar(my.name) > 3 & nchar(my.name) < 12){
  paste("medium name")
} else{
  paste("long name")
}


# for loop

# loop over iterations and print number of iteration
for(it in 1:10){
  print(paste("iteration ", it, sep = ""))
}

# for loop


# sum of numbers in a sequence
sequence <- c(1,2,3,4,5)
s <- 0 # initial sum

for(val in sequence){
  s <- s + val
  print(paste("value = ", val, sep = ""))
  print(paste("s = ", s, sep = ""))
  print("--------------------")
}

# for loop with conditional statement
# (count number of even numbers in a vector)
x <- c(1,3,2,4,5,10,22,21,100) # given numbers
count <- 0 # counter for even numbers

for(val in x){
  if(val %% 2 == 0){ # if number is divisible with 2
    count <- count + 1
  }
}

print(count)

# for loop with conditional statement
# (count number of even numbers in a vector)
x <- c(1,3,2,4,5,10,22,21,100) # given numbers
count <- 0 # counter for even numbers

for(val in x){
  if(val %% 2 == 0){ # if number is divisible with 2
    count <- count + 1
  }
}

print(count)

# next & break statement


# break statement

# break when sum reaches 100
n_max <- 100 # max number in a sequence
s <- 0 # initial sum

for(val in 1:n_max){
  s <- s + val
  print(paste("value = ", val, sep = ""))
  print(paste("s = ", s, sep = ""))
  print("--------------------")
  
  if(s >= 100){
    break
  }
}


# loop over iterations and print number of iteration (break statement)
for(it in 1:100){
  print(paste("iteration ", it, sep = ""))
  if(!it %% 93){
    break
  }
}


# next statement

# print only odd number
n=50

for (k in 1:n){
  if (!k %% 2)
    next
  print(k)
}

# for loops

# Solution:

# The idea here:
# - we would like to write a R program that will calculate the sum of 10 random numbers (that R generates)
# - the for loop should iterate over each random number
# - in every loop iteration, sum of numbers shoud be updated

# the code - just fill the parts when instructed
#   line # 5 #: index is missing for a number extracted from vector of random numbers (inside brackets "[ ]")
#   line # 6 #: extracted number is missing in a sum (right after "s +")


# ---------  R program --------- #
random_numbers <- runif(n = 10, min = 0, max = 1) # generate a vector of random numbers (between 0 and 1, 10 numbers)
s <- 0											  # initial sum before the loop s = 0

for(i in 1:length(random_numbers)){               # loops over vector of numbers
  number <- random_numbers[i]					  # current random number extracted from a vector
  s <- s + number								  # adds value of current random number to sum s
}

print(s)										  # prints the final sum of random numbers
# ---------  R program --------- #



# while loop

# sum of numbers

s <- 0 # initial sum
i <- 1 # initial value of i
while(i <= 10){
  s <- s + i 
  print("-----------------")
  print(paste("i = ", i, sep = ""))
  print(paste("s = ", s, sep = ""))
  i <- i + 1 
}


# print each number until condition is met

i <- 1 
while(i^2 <= 100){ # until square of a number is less or equal than 100
  print(i)
  i <- i + 1 
}


# infinity while loop with break statement
i <- 1
while(1 == 1){
  if(i > 20){
    break
  }
  print(i)
  i <- i + 1
}


# nested loops

# iterate over a matrix and print each element
M <- matrix(data = 1:25, nrow = 5, byrow = T)
M

for(i in 1:dim(M)[1]){
  for(j in 1:dim(M)[2]){
    print("---------------------------")
    print(paste("Element M[", i, ",", j, "]", sep = ""))
    print(M[i,j])
  }
}

# iterate over a 3D array and print square of each element
A <- array(data = 1:27, dim = c(3,3,3))
A
for(k in 1:dim(A)[3]){
  for(j in 1:dim(A)[2]){
    for(i in 1:dim(A)[1]){
      print("---------------------------")
      print(paste("Element M[", i, ",", j, ",", k, "]", sep = ""))
      print(A[i,j,k]^2)
    }
  }
}

# Code challenge
# Module 5: Programming
# for loops

# Solution:


# The idea here:
# - we would like to write a R program that will simulate a game of throwing a dice
# - in every iteration the gambler throws the dice
# - the game is played so long until the gambler throws number 6 for the first time
# - after gambler throws 6 for the first time, the game stops
# - dice throwing is already written, you only need to add a stopping criteria,
# - and a print statement that will tell us, how many throws were needed to complete a game

# the code - just fill the parts when instructed
#   line # 6 #: finish logical statement syntax - loop should break when number 6 lands! 
#   line # 7 #: write the syntax for stopping a loop or breaking it!


# ---------  R program --------- #


dice_numbers <- 1:6	  										            # 1 # # numbers 1,2,3,4,5,6 for a normal dice
i <- 1														                    # 2 # # iteration index (number of throws), we start with 1st throw
# 3 #
while(1 == 1){				                    			      # 4 # # infinity while loop, breaking condition added inside a loop!
  number_landed <- sample(x = dice_numbers, size = 1) # 5 # # number landed on a dice
  if(number_landed == 6){					                    # 6 # # logical statement - tests if number 6 landed
    break                                           # 7 # # stop loop statement when number 6 lands
  }													                          # 8 #
  i <- i + 1											                    # 9 # # update iteration index
} 															                      # 10#											    
# 11#
print(paste0("Number of dice throws: ", i))					  # 12# # prints the final number of dice throws (number of iterations)


# User defined functions (UDF)

# Write your first function
power <- function(x,a){
  y <- x^a
  return(y)
}

power(2,2)
power(4,5)

# function for concatenating two strings
my_concat <- function(s1, s2){
  print(paste(s1, s2))
}

my_concat("Hello", "world")


# Default function arguments
power <- function(x,a=2){
  y <- x^a
  return(y)
}

power(2)
power(2,5)


# Return single or multiple arguments

# multiple output
my_stats <- function(vec){
  mean_val <- mean(vec)
  sd_val <- sd(vec)
  median_val <- median(vec)
  sum_val <- sum(vec)
  
  output <- list(mean = mean_val, 
                 sd = sd_val,
                 median = median_val,
                 sum = sum_val)
  return(output)
}

v <- 1:10
my_stats(v)


# Ellipses "..." - additional func parameters

my_sum <- function(vec, ...){
  s <- sum(vec, ...)
  return(s)
}

v <- c(1,2,-4,5,NA)
v
my_sum(v)
my_sum(v, na.rm = T) # call argument of sum() function


# Anonymous function

# anonymous function for extracting the max value
function(x){max(x)}

M <- matrix(data = 1:100, nrow = 10, byrow = T)
rownames(M) <- paste("row", 1:nrow(M), sep = "")
colnames(M) <- paste("col", 1:nrow(M), sep = "")

apply(X = M, MARGIN = 1, FUN = function(x){max(x)})
apply(X = M, MARGIN = 2, FUN = function(x){max(x)})


# Recursive functions (Recursion)

# Fibonaci sequence (no recursion)
fibonacci_seq <- function(n){
  f_sequence <- NULL
  for(i in 1:n){
    if(i <= 2){
      f <- 1 # first two elements are 1
    } else{
      f <- f_sequence[i-2] + f_sequence[i-1] #for all other cases fibonacci number is sum of previous two numbers
    }
    f_sequence <- c(f_sequence, f)
  }
  return(f_sequence)
  print(f)
}

fibonacci_seq(1)
fibonacci_seq(2)
fibonacci_seq(3)
fibonacci_seq(5)
fibonacci_seq(10)
fibonacci_seq(25)


# Fibonaci sequence (recursion)
fib_r <- function(n){
  if(n <= 2){
    return(1)
  }
  return(fib_r(n-1) + fib_r(n-2))
}

for(i in 1:10){print(fib_r(i))}


# call function from a different script

# create new script - my_functions.R
# save functions into script
# call functions from another script

rm(list = ls())

# source script
source("./my_functions.R")

power(2,5)
fibonacci_seq(10)
my_stats(runif(n = 10, min = -5, max = 5))




# User defined functions

# Solution:

# Instructions:

# 1) Create a function named "subtraction".
# 2) The function has two numeric inputs "a" and "b" (arguments).
# 3) The function calculates the difference between numbers "b" and "a".
# 4) At the end use your function to calculate the difference between numbers 11564 and 1578.

subtraction <- function(a,b){
  return(b-a)
}

subtraction(a = 1578, b = 11564)










# Code vectorization

# apply()
A <- array(data = 1:24, dim = c(4,3,2), dimnames = c(list(paste("row", 1:4, sep = ""), paste("col", 1:3, sep = ""), paste("mat", 1:2, sep = ""))))

apply(X = A, MARGIN = 1, FUN = sum)
apply(X = A, MARGIN = 2, FUN = mean)
apply(X = A, MARGIN = 3, FUN = max)


# lapply()

# max of elements (over a list)
v <- 1:10
log <- c(T, F, T, T, F)
num <- 1000
L <- list(v = v, log = log, num = num)

lapply(X = L, FUN = max)

# change strings to upper (strings in a vector)
names <- c("Mark", "John", "Jack", "Violet", "Katty")
lapply(names, toupper)

# extract elements froma  list
M1 <- matrix(data = 1:8, nrow = 2, byrow = T)
M2 <- matrix(data = 1:9, nrow = 3, byrow = T)

List <- list(M1 = M1, M2 = M2)

# extract 2nd column
help("[")
lapply(List, "[", , 2) # 2nd column vector of matrices

# extract 1st row
lapply(List, "[", 1, ) # 1st row vector of matrices

# extract element in 2nd row and 3rd column
lapply(List, "[", 2, 3) 


# sapply()

# sapply() ~ lapply() (otput returned)
M <- matrix(data = runif(100, min = 0, max = 10), nrow = 10)
M
L <- lapply(M, max) # returns a list
class(L)
L

v <- sapply(M, max) # returns a vector
class(v)
v

# lapply() with unlist()
unlist(L) # returns a vector

# apply()

# Solution:

# First run the code below to create a matrix ("gauss") containing 3 vectors generated from 3 different Gaussian distributions!
gauss1 <- rnorm(n = 1000, mean = 0, sd = 1)   # vector 1 mean = 0, standard deviation = 1
gauss2 <- rnorm(n = 1000, mean = 10, sd = 3)  # vector 2 mean = 10, standard deviation = 3
gauss3 <- rnorm(n = 1000, mean = 50, sd = 10) # vector 3 mean = 50, standard deviation = 10
gauss <- cbind(gauss1, gauss2, gauss3) # matrix


# Use R to execute the steps given below:
# 1) use apply() function on a matrix "gauss" to calculate the mean 
#    of each vector-columns (hint: for mean we use "mean" function, aggregate across columns!)
apply(X = gauss, MARGIN = 2, FUN = mean)

# 2) use apply() function on a matrix "gauss" to calculate the standard deviation 
#    of each vector-column (hint: for stan. deviation we use "sd" function, aggregate across columns!)
apply(X = gauss, MARGIN = 2, FUN = sd)


# replicate()

# replicate() for repetaing as rep()
replicate(n = 10, expr = "string")

# repeat function
replicate(n = 5, round(runif(n = 10, min = 0, max = 1))) # repetas function call n times

# repeat iterations in a simulation
digits <- 0:9 # digits

digits_generate <- function(v, n = 5){ # function that randomly generates digits and concatenates them
  digits <- sample(x = v, size = n, replace = T)
  return(paste(digits, collapse = ""))
}

replicate(n = 100, digits_generate(v = digits, n = 15)) # repeat function call

s<-0
for(val in 1:5){
  s <- s+val
}
print(s)


power <- function(x,a){
  y<-x^a
  return(y)
}
power(3)

my_stats <- function(vec){
  mean_val <- mean(vec) 
  sd_val <- sd(vec)
  median_val <- median(vec)
  sum_val <- sum(vec)
  output <- list (mean = mean_val,
                  sd = sd_val,
                  median = median_val,
                  sum = sum_val)
  return(output)
  
}

v <- 1:5
my_stats (v)






# generate a matrix 5 rows and 2 columns

M <- matrix(data = 1:10, nrow = 5, byrow = T)

# add row names

rownames(M) <- paste("row", 1:nrow(M), sep = "")

# add column names

colnames(M) <- paste("col", 1:ncol(M), sep = "")

# apply function over selected dimension to get aggregate 
S1 <- apply (X = M, MARGIN = 1, FUN = function(x){sum(x)})
# sum of elements of the aggregate

sum (S1)




L <- list(a = 1,
          s = c("word", "string"),
          V = seq(1,100,1))

L.count <- 1 # counter for object in a list

i <- 1

while(1 == 1){
  
  # counter for element inside list object
  
  element <- L[[L.count]]
  
  for(e in element) {
    
    i <- i + 1
    
  }
  
  L.count <- L.count + 1
  
  if(L.count > length(L)){
    break
  }}
    print(i)
