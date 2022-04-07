
###############################################################################
###### Introduction to R: 4-15-2022 ### Drew E. Winters, PhD. #################
###############################################################################



# note there are two lineages in the R language
  #> 1) Base R
  #> 2) Tidyverse
# We will use the base R 
  # Tidyverse is the same R just with a different syntactic structure 
    # You will likely use some tidyverse as you learn more about R
  # Tidyverse is not hard to pick up after learning base R 




          #### Basic Functions ####


# basic arithmetic operations

2 + 3 # addition
2 - 3 # subtraction
2*3   # multiplication
2/3   # division
2^3   # exponentiation
2**3  # equivalent exponentiation command



# precedence of operators
  # note R follows basic algebra order of operations

5^2 - 4*2
6 + 5 - 1
2^-4


      ## code clarity 
(5^2) - (4*2) # use parentheses to group for clarity 
  # the next two have different results - parentheses for correct calculations
5 + 4^2
(5 + 4)^2

-2--4     ## This is challenging to read 
-2 - -4   # Instead use spaces to for clarity 





        #### Printing mathematical sentences ####

# you can print strings and numbers together in a sentence like structure
paste("I like the number", 5, "and", 4)

# you can include mathematical functions in these sentences
print(paste("multipling 5*4 = ", 5*4))






          #### Creating vectors (non object) ####

# a vector is a sequence of data elements of the same basic type. Members of a vector are called Components. 

c(1, 2, 3, 4)  # combine or concatenate - makes a list

1:4     # integer-sequence operator
4:1     # reverse sequence
-1:2    # starts from negative to positive
-(1:2)  # entire list is negative 
seq(1, 4)
seq(2, 8, by=2) # specify interval
seq(0, 1, by=0.1) # non-integer sequence
seq(0, 1, length=11) # specify number of elements
seq(0, 5, length=11)




          #### vectorized arithmetic (non object) ####

c(1, 2, 3, 4)/2
c(1, 2, 3, 4)/c(4, 3, 2, 1)
  # using the mean function on a vector (will cover functions later)
sum(0.1, 1, 10, 100)/4
mean(c(0.1, 1, 10, 100))

c(1, 2, 3, 4) + c(4, 3) # no warning 1+4 2+3 3+4 4+3
c(1, 2, 3, 4) + c(4, 3, 2) # produces warning doesn't finish the cycle b/c one is bigger than the other = warning






        ##### creating objects (variables) by assignment #####

x <- c(1, 2, 3, 4) # assigning a vector to x
x # print


x/2            # divides each number in the vector by 2 - same as c(1, 2, 3, 4)/2
(y <- sqrt(x)) # parentheses to assign and print trick


(x <- rnorm(100)) #assigning numbers randomly from a standard distribution
head(x) # first few items of x
summary(x)  # a "generic" function



  # you can assign mathematical operations to objects
(a<- 5*4)


(b<- 5+4)


  # and print this in a sentence

print(paste("multipling 5*4 = ", a, ", adding 5+4 = ", b))





      #### functions, arguments to functions, obtaining help and information ####

# what is a function 
  # an integrated set of commands you can use to run specific processes
  # this makes your projects much easier so you don't have to run everything by hand. 

mean(c(2,3,4,5)) #  mean of a vector
sd(c(2,3,4,5))   #  standard deviation of a vector
median(c(2,3,4,5)) # median of vector

sqrt(5) # square root function



# Help information for functions 

  # arguments for commands
args(sqrt) # arguments of the sqrt() function
args(mean)

  # Documentation for function
help("mean")    # documentation
?mean           # equivalent 
?sqrt

help.search("mean")        # search the help function in r

RSiteSearch("mean", "functions")     # searching the r website for help

  # examples with function
example("mean") # execute examples in help page
# example("sqrt")

    # you can take the code provided in the example and run it yourself in r






        #### basic indexing ####

# for retrieving specific items from an object - a vector, data set, or matrix

(x <- rnorm(100))

x[12]             # 12th element
x[2]              # second element
x[3]              # third element
x[6:12]           # elements 6 through 15
x[c(1, 3, 5)]     # 1st, 3rd, 5th elements 

x[-(11:100)] # omit elements 11 through 12
x[1:10]      # same!

(v <- 1:4)
v[c(TRUE, FALSE, FALSE, TRUE)] # logical indexing







#### __________________ If we have time ___________________________________#### 





        #### character and logical data ####

  # needed to make logical statements
    # Can help when looking for specific items in a list or dataframe

words <- c("To", "be", "or", "not", "to", "be")
words
paste(words, collapse=" ") #paste is concatenate

logical.values <- c(TRUE, TRUE, FALSE, TRUE)
  # you can use the ! to indicate no or not (negation)
!logical.values # prints the opposite values assigned

sum(logical.values)      # number of TRUEs (coercion to numeric)
sum(!logical.values)     # number of FALSEs (TRUE-> 1, FALSE -> 0)






      #####comparison and logical operators ####



1 == 2       # equal to
1 != 2       # not equal to
1 <= 2       # less than or equal to
1 < 1:3      # less than (vectorized) 
3:1 > 1:3    # greater than
3:1 >= 1:3   # greater than or equal to

TRUE & c(TRUE, FALSE)                        # logical and
c(TRUE, FALSE, FALSE) | c(TRUE, TRUE, FALSE) # logical or
TRUE && FALSE  # unvectorized and (for programming)
TRUE || FALSE  # unvectorized or

! c(T, F)   # abbreviations of TRUE and FALSE, best avoided!
T <- FALSE  # perverse! (but in most cases innocuous)
T
remove(T)
TRUE <- FALSE  # fails

(z <- x[1:10])      # first 10 elements of x
z < -0.5            # is each element less than -0.5?
z > 0.5             # is each element greater than 0.5
z < -0.5 | z > 0.5  #  < and > are of higher precedence than |
abs(z) > 0.5        # absolute value, equivalent to last expression
z[abs(z) > 0.5]     # values of z for which |z| > 0.5







                 #### using real data ####


  # here we will use data in the r package carData
install.packages("carData")
library(carData)
  # and assign that data to an object
duncan.data <- carData::Duncan
  ## example of how you would load a csv file on your CPU
#duncan.data <- read.csv("C:\\username\\filepath\Duncan_data.csv")


# data set description 
help("Duncan")  
 #Variable names 
  #1) Type
    #> Type of occupation. 
    #> A factor with the following levels: 
      #> prof == professional and managerial; 
      #> wc == white-collar; 
      #> bc == blue-collar.
    
  #2) Income
    #> Percentage of occupational incumbents in the 1950 US Census who earned $3,500 or more per year 
      #> (about $36,000 in 2017 US dollars).
  
  #3) Education
    #> Percentage of occupational incumbents in 1950 who were high school graduates 
      #> (which, were we cynical, we would say is roughly equivalent to a PhD in 2017)
  
  #4) Prestige
    #> Percentage of respondents in a social survey who rated the occupation as "good" or better in prestige


  # viewing the data
duncan.data
    ## or
View(duncan.data)
  #viewing just the first few lines
head(duncan.data)
  # Viewing the structure. 
str(duncan.data)
  # dimensions of dataset
dim(duncan.data)


  # Descriptive statistics for the data
install.packages("psych")
library(psych)
  # descriptive stats for continuous variables
psych::describe(duncan.data[,2:4])
  # numbers for categorical
table(duncan.data$type)
    # creating a descriptive table with n and % by type
a<-data.frame(rbind(as.character(table(duncan.data$type)), round(table(duncan.data$type)/NROW(duncan.data$type),3)))
rownames(a)<-c("n","%")
a


install.packages("car")
library(car) # we use the car library for its scatter plot function 
  # education associating with income
scatterplot(income ~ education, data=duncan.data)
  # prestige associating with income
scatterplot(income ~ prestige, data=duncan.data)
  # education associating with prestige
scatterplot(prestige ~ education, data=duncan.data)


# running an anova on mean differences in income by profession type
inc <- aov(income ~ type, data=duncan.data)
  # viewing the results
summary(inc)
  # post-hoc between group comparisons 
TukeyHSD(inc)

  # a box plot of mean differences in income by profession type
boxplot(income ~ type, data=duncan.data)



# a figure depicting education associating with income by type of job
install.packages("ggplot2")
library(ggplot2)

ggplot(duncan.data,aes(y=income, x=education, color= type)) + 
  geom_point(alpha=.5) + 
  geom_smooth(method="lm", formula= y~x, se=FALSE, size=2) + 
  theme_minimal()





          #### additional resources ####


## Resources to learn R and other coding languages 
  # FREE
    #1) Software carpentry : https://software-carpentry.org/lessons/
    #2) Free book: R for data science - https://r4ds.had.co.nz/
    #3) Free interactive exercises: freeCodeCamp.org



## R commander - this may help people get started ## 
  # R commander is a point and click interface much like spss or stata 

  # Documentation: https://socialsciences.mcmaster.ca/jfox/Misc/Rcmdr/ 

  # how to install 
#install.packages("Rcmdr")
#library(Rcmdr)

  # in mac you have to install xquartz inorder to use *see documentation above*





