#Basic Data Structures in R
#8th March 2021

#Integers
i <- 1L

typeof(i)
class(i)

#numeric - double
d <- 1
typeof(d)
class(d)

is.integer(i)
is.integer(d)
is.numeric(d)
is.numeric(i)

#Complex Number
z<-complex(real =1,imaginary = 2)
typeof(z)
class(z)
z1 <- complex(real = 3,imaginary = 2)
z2 <- complex(real = 1,imaginary = 3)
paste(z1,z2)

Re(z1)
Im(z1)

z1+z2
z1-z2
z1*z2
z1/z2

Conj(z1)

ii <- complex(real = 0,imaginary = 1)
ii*ii

# Logical
1>0
1<0

l1<-1>0
l2<-1<0

typeof(l1)
class(l1)

l3 <- T
l4 <- FALSE

#code challenge

#Basic data types
#Description
#R has a built-in function typeof() to check the data type of objects in R.
#Example: To check the data type of the number 20.256
#1) In R console, type in typeof(20.256)
#2) Press Enter. The R return text "double" meaning that 20.256 is a number with floating-point.
#Instructions:
#Use R to check data types of the objects given below:
#1) 2L
#2) 20
#3) 20.025
#4) 1 + 1i
#5) FALSE


# Solution:
# 1) 2L
typeof(2L)
# 2) 20
typeof(20)
# 3) 20.025
typeof(20.025)
# 4) 1 + 1i
typeof(1 + 1i)
# 5) FALSE
typeof(FALSE)


#Strings
s <- "word"
s
class(s)
typeof(s)

s1 <- "double quotes"
s2 <- 'single quotes'
s3 <- "text 'word' text"
s3
s4 <- 'text "word" text'
s4

#s5 <- ""wrong""
#s6 <- 'wromg"

empty_string <- character(0)
s <- c(1:3, sqrt(2),"string")
s
class(s)

print("String")
paste("a","b","c")
paste("a","b","c", sep="")
paste("a","b","c", sep=",")
paste("a","b","c", sep=", ")
paste("i",1:10,sep=".")
paste("i",1:10,sep="",collapse="")

cat("Hello","world","!",sep="   ")
s1<-paste("i",1:10,sep="",collapse="")
s1
nchar(s1)

df <- USArrests

View(df)
head(df)
head(df,n=2)

rownames(df)

states <- rownames(df)
toupper(states)
tolower(states)
casefold(states, upper = T)
casefold(states, upper = F)

str <- "Hello world!"
str
chartr(old = "o", new = "0", x = str)

sort(x = states, decreasing = TRUE)
substr(x = "Alabama", start = 1, stop=3)

# code challenge:

# 1) create an object s1 by assigning a string "Hello"
s1 <- "Hello"

# 2) create an object s2 by assigning a string "World!"
s2 <- "World!"

# 4) use paste() function to create object s by pasting together 
#    objects s1 and s2 (in given order), for a separator between 
#    strings use white space sep=" "
s <- paste(s1, s2, sep = " ")

# 5) check type of object s, use typeof()
typeof(s)


# Special R Values

# Missing data - NA (Not Available)
a <- NA
b <- 5
a+b

#test for NA
is.na(a)
is.na(b)
v <- c(NA,1,2,3,4,NA)
is.na(v)

#NaN - Not a number
a<-0/0
is.nan(a)

#infinity
100/0
-100/0
is.infinite(100/0)


#Data Conversion

#number to logical
as.logical(0)
as.logical(1)
as.logical(100)
as.logical(-100)

#logical to numeric
as.numeric(T)
as.numeric(F)

#num to string
num <- 100
str<- as.character(num)
num
str

#string to number
as.numeric(str)
class(str)

#multiple conversion
num_to_str_to_num <- as.numeric(as.character(num))
class(num_to_str_to_num)

is.numeric(1L)
class(12.52)


i <- T
j <- F
k <- T

L1 <- i&j
L2 <- i|j
L3 <- !!k
L4 <- !(L1|L3)

print(L1)
print(L2)
print(L3)
print(L4)

print(paste("i",1:10,sep=":"))

a1 <- as.logical(0)
a2 <- as.numeric(a1)
print(100^a2)

s1 <- "a"
s2 <- "bc"
s3 <- "def"

SS1 <- paste(s1,s2,sep = "")
SS2 <- paste(SS1, s3, sep = " ")
SS3 <- paste("A",SS2,"Z",sep=".")

print(SS3)

i <- T
j <- F
k <- T
m <- F

statement <- !((!i&j)|(k|m))&TRUE
print(statement)
