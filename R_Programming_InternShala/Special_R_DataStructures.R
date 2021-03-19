#4. Special R Data Structures
#categorical Variables

#factor
gender <- factor(x=c("male","female","female"))
gender
str(gender)
class(gender)
typeof(gender)

#own levels -custom levels
levels(gender)
gender <- factor(x=c("male","female","female"),levels = c("male","female"))
gender <- factor(x=c("male","female","female"),levels = c("male","female"), ordered = T)

gender

#properties
levels(gender)
is.factor(gender)
is.ordered(gender)

#create some factor variables
strings <- c("a","b","a","b")
f_strings<-factor(strings)
f_strings

numbers <- 1:10
f_numbers <- factor(numbers)

#access elements/ gender bigger factor variable
gender <-c(rep("male",25),rep("female",30))
shuffled_index <- sample(1:length(gender),size = length(gender), replace =F) #random shuffled index
gender <- gender[shuffled_index]
gender <- factor(x=gender, levels = c("female","male"))

#access elements
gender
gender[50]

#add elements
gender[56:60] <- "female"
gender
length(gender)

#remove elements
gender<- gender [1:55]

gender[56] <- "unknown"

#add new level
levels(gender)<-c(levels(gender),"unknown")
gender <- droplevels(gender)

# Categorical variables
# Solution:
# First run the code below to create a vector of colors!
colors.intial <- c(rep("red", 3), rep("green", 5), rep("blue", 2)) # create vector of colors
colors.intial <- colors.intial[sample(x = 1:length(colors.intial), size = 10, replace = F)] # reshuffle colors
colors <- as.factor(colors.intial) # convert to factor

# Use R to execute the steps given below:
# 1) Check length of factor object!
length(colors)

# 2) Extract factor levels.
levels(colors)

# 3) Change the order of factor variable, new order: "red", "green", "blue"
#    (hint: recreate factor variable with factor() using levels attribute)
colors <- factor(x = colors, levels = c("red", "green", "blue"))




### 4.2 date and time objects

#current date
cur_date <- Sys.Date()
class(cur_date)
typeof(cur_date)
unclass(cur_date)

#print different formats
format(cur_date, "%Y")
format(cur_date, "%m-%d")
format(cur_date, "%B") #string month
format(cur_date, "%j")
format(cur_date, "%w") #week day
format(cur_date, "%W") #week of year

#date object calculations
sel_date <- as.Date("2021-01-01",format="%Y-%m-%d")

#difference
sel_date - cur_date

difftime(time1 = sel_date, time2 = cur_date, units = "weeks")
cur_date+100

#generate vector of dates
select_holidays <- as.Date(c("2020-01-01","2020-12-25",'2020-12-31'))
names(select_holidays) <- c("New Year Day","Xmas","New years eve")

select_holidays
select_holidays-1

diff(select_holidays)

#generate days
days_2020 <-seq(from=as.Date("2020-01-01"),length=365,by="day")
days_2020

#generate weeks
weeks_2020 <-seq(from=as.Date("2020-01-01"),length=53,by="week")
weeks_2020
as.Date("2020-12-31")+1


#date time object
#POSIXct
dt_ct <- as.POSIXct("2020-01-01 08:00:20", format = "%Y-%m-%d %H:%M:%S")
dt_ct

class(dt_ct)
typeof(dt_ct)
unclass(dt_ct)

#POSIXlt
dt_lt <- as.POSIXlt("2020-01-01 08:00:20", format = "%Y-%m-%d %H:%M:%S")
dt_lt
class(dt_lt)
typeof(dt_lt)
unclass(dt_lt)

dt_lt$`hour`

#specify time zone
dt_lt <- as.POSIXlt("2020-01-01 08:00:20", format = "%Y-%m-%d %H:%M:%S", tz="GMT")
dt_lt

#calculation
cur_dt <-Sys.time()
dt1 <- as.POSIXct("2020-01-01 20:45:20", format = "%Y-%m-%d %H:%M:%S")
dt1-cur_dt

#difference in seconds
difftime(dt1,cur_dt,units="secs")
cur_dt-360

#generate a sequence
mins_010120 <- seq(as.POSIXct("2020-01-01 00:00:01", format = "%Y-%m-%d %H:%M:%S"),length = (24*60),by = "min")
mins_010120

#extraction only hrs and min
format(mins_010120,"%H:%M")


# Date & time objects
# Solution:
# Use R to execute the steps given below:
# 1) Store date 13th of August in 2015 into date object date1 (hint for the date 2015-08-15).
date1 <- as.Date("2015-08-15")
# 2) Store date 21st of March in 2017 into date object date2.
date2 <- as.Date("2017-03-21")
# 3) Now calculate the difference in days between date2 and date1 object.
date2 - date1 # option 1
difftime(date2, date1, units = "days") # option 2





#4.3 Data Frames
#df create

df1 <- data.frame(col1 = 1:3,
                  col2 = c("a","b","c"),
                  col3 = c(T,F,T))
str(df1)
df1
View(df1)

#DF create using vector
col1 <- 1:3
col2 <- c("a","b","c")
col3 <- c(T,F,T)
df2 <- data.frame(num = col1, str = col2, log = col3)
df2

#create from a matrix
M <- matrix(data = 1:100, nrow = 10)
rownames(M) <- paste("row", 1:10, sep="")
colnames(M) <- paste("col", 1:10, sep="")
M
df3 <- as.data.frame(M)

#properties
dim(df3)
nrow(df3)
ncol(df3)
length(df3)
class(df3)
typeof(df3)

#access df elements
df_emp <- data.frame(id = 1:6,
                     name=c("Max","Jane","John","Tony","Janis","Helen"),
                     surname=c("Gordon","Smith","Don","Price","Jett","Dust"),
                     age =c(55,35,46,22,60,27),
                     data_start_work = c(as.Date("1985-09-01"),as.Date("2010-10-01"),
                                         as.Date("1999-06-01"),as.Date("2019-03-20"),
                                         as.Date("1980-04-15"),as.Date("2015-02-20")),
                     gender = c("M","F","M","M","F","M"),
                     manager_position = c(T,F,F,F,T,F))
View(df_emp)

df_extr <- df_emp["name"]
class(df_extr)

df_extr <- df_emp[["name"]]
class(df_extr)
typeof(df_extr)



df_emp$name

# data frame slicing

df_emp[2,2]
df_emp[2,"Name"]

df_emp[1:4,6:7]
df_emp[1:4,c("gender","manager_position")]

df_emp[5:6,]

typeof(df_emp["surname"])


#modify a dataframe
#append a column
df_emp <- cbind(df_emp, role = c("director","secretary","analyst","researcher","CEO","analyst"))
df_emp$new_col<-1

#append a row
df_emp <- rbind(df_emp, list(7,"Mark","Jax",32,as.Date("2020-01-01"),"M",F,"researcher",1))

#remove column
df_emp$new_col <- NULL

#remove row
df_emp <- df_emp[-7,]

#merge two data frames
df_new_emp <- data.frame(id =7,
                     name = "Mark",
                     surname="Jax",
                     age=32,
                     date_start_work=as.Date("2020-01-01"),
                     gender="M",
                     manager_position=F,
                     role="researcher")
df_new_emp

df_emp <- rbind(df_emp, df_new_emp)


#tips
summary(df_emp)

#row subsetting
subset(x=df_emp,gender=="M")
subset(x=df_emp, gender)

#some built in dataset
iris
mtcars
USArrests
PlantGrowth



# Data frames

# Solution:

# Use R to execute the steps given below:

# 1) Create a data frame based on the given table. The name of the data frame should be "heroes".
heroes <-  data.frame(id = 1:3, 
                      name = c("Aragorn", "Legolas", "Gimli"),
                      race = c("human", "elf", "dwarf"),
                      weapon = c("sword", "bow", "axe"))

# 2) Extract column "name" from data frame "heroes".
heroes$name






#### 5 Import flat file 
#text and csv
#txt(";" saperator, rownames, colnames)
df_txt1 <- read.table(file="./data_import/df_semicolon.txt", header = T, sep = ";")
#txt("\t" saperator, rownames, colnames)
df_txt2 <- read.table(file="./data_import/df_tab.txt", header = T, sep = "\t")


getwd()

#csv
df_csv1 <- read.table(file="./data_import/df_comma.csv", header = T)

#excel file

install.packages("readxl")
library(readxl)

df_xls1 <- readxl::read_excel(path = "./data_import/df.xlsx", sheet = "cars")

#import cars excel
df_xls1 <- readxl::read_excel(path="./data_import/df.xlsx", sheet = "eruptions")

# Code challenge
# Module 4: Special R Data Structures & handling with R's input/output
# Import flat files
# Solution:
# Use R to execute the steps given below:
# 5) Write R code that would import text file "measurements.txt" and store the 
#    data into new object called "measurements" inside R environment.
#    (You do not have to run your code!)
measurements <- read.table(file = "measurements.txt", header = T, sep = "\t")

# url html json
#webpage - url
df_url <- read.table(file = "http://www.stats.ox.ac.uk/pub/datasets/csb/ch1a.dat")

# Jason
install.packages("rjson")
library(rjson)
require(rjson)
list_json <- rjson::fromJSON(file = "./data_import/data.json") # we import a list!!!

# Import data from statistical software

install.packages("haven")
library(haven)

# Import SPSS data (.sav)
df_SPSS <- haven::read_spss(file = "./data_import/survey.sav")

# Import STATA data (.dta)
df_STATA <- haven::read_stata(file = "./data_import/airline.dta")

# Import SAS data (.sas7bdat)
df_SAS <- haven::read_sas(data_file = "./data_import/cola.sas7bdat")

# Import data from database
# test dataset SQLite
install.packages("RSQLite")
library(RSQLite)

# connect to DB
con <- RSQLite::dbConnect(RSQLite::SQLite(), dbname = "./data_import/chinook.db")

# get list of all tables
dbListTables(con)

# get colnames of table
dbListFields(con, "albums")

# read table in memory
dbReadTable(con, "albums")

# query over table and save results to data frame 
df_DB <- dbGetQuery(con, "SELECT * FROM albums;")

# close DB connection
RSQLite::dbDisconnect(con)



# Code challenge
# Module 4: Special R Data Structures & handling with R's input/output
# Import data from the web

# Solution:

# 1) On the url link "www.my_data.com" you can access a webpage that contains tabular data about past weather conditions.
# 2) If you take a preview of a webpage with your browser, you are able to notice that
#    table contains header (first row of a table), and "," (comma) is used as a separator for columns.  

# 3) Write R code that would import tabular data from provided url and store the 
#    data into new object called "weather" inside R environment.
#    (You do not have to run your code!)
weather <- read.table(file = "www.my_data.com", header = T, sep = ",")


#### 6 Export data to a file

# lets create DF to export it
df <- data.frame(id = 1:10, 
                 string = rep("a",10), 
                 date = seq(as.Date("2020-01-01"), length = 10, by = "day"),
                 rnd_number = runif(n = 10, min = 0, max = 1)
)
df


# Export data to a file

# download data_export.zip file and copy it to project folder and unzip it!!!

# lets create DF to export it
df <- data.frame(id = 1:10, 
                 string = rep("a",10), 
                 date = seq(as.Date("2020-01-01"), length = 10, by = "day"),
                 rnd_number = runif(n = 10, min = 0, max = 1)
)
df

# Export to txt / csv file

# export to txt file (";" separator)
write.table(x = df, file = "./data_export/df_semicolon.txt", col.names = T, sep = ";")

# export to txt file ("\t" separator without quotes)
write.table(x = df, file = "./data_export/df_tab.txt", col.names = T, sep = "\t", quote = F)

# export to csv file ("," separator without quotes, rownames added)
df1 <- df
rownames(df1) <- paste("row", 1:10, sep = "")
write.table(x = df1, file = "./data_export/df_tab.csv", col.names = T, sep = ",", quote = F, row.names = T)


# Export to .xlsx file

install.packages("writexl")
library(writexl)
write_xlsx(x = df, path = "./data_export/df.xlsx")
library(rio)
rio::export(df, "./data_export/df1.xlsx")


# Export data to .json

library(rjson)
list_json <- rjson::fromJSON(file = "./data_import/data.json") # we import a list!!!

#install.packages("jsonlite")
library(jsonlite)
write(toJSON(list_json), "./data_export/df.json")



# Code challenge
# Module 4: Special R Data Structures & handling with R's input/output
# Export flat files
# Solution:
# Use R to execute the steps given below:
# 5) Write R code that would export R object "scores" into a .csv file "scores.csv" 
#    into selected folder.
#    (You do not have to run your code!)
write.table(x = scores,
            file = "./data_export/scores.csv", 
            col.names = T, 
            row.names = T, 
            sep = ";")



# Export data to statistical software format

library(haven)

# Export to SPSS data (.sav)
haven::write_sav(data = df, path = "./data_export/df.sav")

# Export to STATA data (.dta)
haven::write_dta(data = df, path = "./data_export/df.dta")

# Export to SAS data (.sas7bdat)
df_SAS <- haven::write_sas(data = df, path = "./data_export/df.sas7bdat")


# Export data to database

library(RSQLite)

# connect to DB
con <- RSQLite::dbConnect(RSQLite::SQLite(), dbname = "./data_export/empty.db")

# get list of all tables
dbListTables(con)

# write data frame to DB table
dbWriteTable(conn = con, name = "df", value = df)

# get list of all tables
dbListTables(con)

# read table in memory
dbReadTable(con, "df")

# query over table and save results to data frame 
df_DB <- dbGetQuery(con, "SELECT * FROM df;")

# close DB connection
RSQLite::dbDisconnect(con)



# Code challenge
# Module 4: Special R Data Structures & handling with R's input/output
# Dealing with data base

# Solution:


# 1) In your R session you have already made a connection to 
#    a SQLite data base using the code below:
library(RSQLite)
con <- RSQLite::dbConnect(RSQLite::SQLite(), dbname = "database.db")

# 2) Now you have to write R code to execute two additional tasks on a 
#    a connected data base:
#    - write a code that will list all table names of a data base into your R console
#    - then write a code that will close the connection to a given data base
#    (You do not have to run your code!)

dbListTables(con) # list all table names
RSQLite::dbDisconnect(con) # close connection


df_emp <- data.frame(id = 1:4,
                     name = c("Max", "Jane", "John", "Tony"),
                     surname =  c("Gordon", "Smith", "Don", "Price"),
                     age = c(55, 35, 46, 22),
                     gender = c("M", "F", "M", "M"),
                     manager_position = c(T, F, F, F))
                     
print(df_emp[[4]])

selected_holidays <- as.Date(c("2020-01-01", "2020-04-12", "2020-12-25", "2020-12-31"), format = "%Y-%m-%d")
print(diff(selected_holidays))


v1 <- 1:100
v2 <- seq(0,1,1/99)
v3 <- c(rep(T,20), rep(F,50), rep(T,30))
v4 <- paste("string", 1:100, sep = "")

df <- data.frame(string = v4,
                 id = v1,
                 double = v2,
                 logical = v3)
            
print(colnames(df[20:50, c(1,3:4)]))


a1 <- paste("0", 9, sep = "")
a2 <- paste("1", "0", sep = "")
            
a3 <- 20^2*5+25
            
d <- as.Date(paste(a1, a2, a3, sep = "."), format = "%d.%m.%Y")
            
print(d)
            