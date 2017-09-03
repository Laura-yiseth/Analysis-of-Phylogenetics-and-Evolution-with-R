## Laura Yiseth Galvis Tuesta
## Lauraygt8gmail
## GPL2.X
## Universidad Industrial de Santander (Bucaramanga).
## Book: Analysis of Phylogenetics and Evolution with R. 2° Edi.
## Author: Emmanuel Paradis
## Second chapter: First Steps in R for Phylogeneticists

################## 2.8 Exercises ##################

## 1.

## print the current working directory
getwd()

## read some data in three different files located in three different directories

read.csv("../Documentos/AlgunDiaMeGraduare/Codigo/loops.R")
read.csv("/home/laura/Descargas/Capitulo2.R")
read.csv("AlgunDiaMeGraduare/Codigo/PdDis2Tre2.R")

## 2. 

# First possibility #

## Create a matrix with three columns and 1000 rows
ejer <- matrix(NA,1000,3)

## each column contains a random variable that follows a Poisson distribution with rates 1,5, and 10, respectively


# help Poisson distribution
?Poisson

# creating a vector whit each rates 
poi1 <- rpois(n= 1000,lambda =1)
poi2 <- rpois(n= 1000,lambda =5)
poi3 <- rpois(n= 1000,lambda =3)

# assign to matrix
ejer[,1] <- poi1
ejer[,2] <- poi2
ejer[,3] <- poi3

# Second possibility #

new_matrix <- cbind(poi1,poi2,poi3)
new_matrix <- as.data.frame(new_matrix)

# third possibility #
ejercicio2 <- data.frame(poi1,poi2,poi3)

# quarter possibility #

# it does not work, repeat the numbers
ac <- rpois(1000,c(1,5,10))
aa <- matrix(ac,1000,3,byrow = F)

# Fifth possibility #
ab <- matrix(c(poi1,poi2,poi3),1000,3,byrow = F)

## compute the means of each column of this matrix.

# First possibility #
mean(ejercicio2$poi1)
mean(ejercicio2$poi2)
mean(ejercicio2$poi3)

# Second possibility #
summary(ejercicio2)

# Third possibility #
apply(ejercicio2,2,mean)


# summary by row
transp <- t(ejercicio2)
summary(transp)

## 3.Create a vector of 10 random normal values using the three following methods.

b<-sample(10, size = 10, replace = FALSE)

## (a) Create and concatenate successively the 10 random values with c.
a <- rnorm(1)
c <- rnorm(1)
d <- rnorm(1)
e <- rnorm(1)
f <- rnorm(1)
g <- rnorm(1)
h <- rnorm(1)
i <- rnorm(1)
j <- rnorm(1)

v1 <- c(a,b,c,d,e,f,g,h,i,j) 

## (b) Create a numeric vector of length 10 and change its values successively.

# creating the empty vector 
c <- rep(NA,10)

# other option 
bbc<- as.character(c(1:10))

# or converting vector in caracter and concatenate
bbc <- paste(c(1:10))

# complete my vector with each position
bbc[1] <- a

# example the a "For"

for(i in 1:10){
  print(i)
}

# first tried
al <- (1:10)

for (i in 1:length(al)){
  al <- rnorm(10)
}

# second tried
alt <- (101:110)

for (i in 1:10){
  print(alt[i])

  alt[i] <- rnorm(1)
  print(alt[i])
  print(alt)
}

alt

## (c) Use the most direct method
fv <- rnorm(10)

## Compare the timings of these three methods
system.time(b)

## 4.

## (a) Read file with read.table using the default options.
tab1 <- read.table("tabla2.csv", sep = ",",col.names = c("bicho","frec"), row.names = "bicho")


## (b) Create a data structure with the numeric values that you could then index with the species names, 
## for example, > x["Mus_musculus"] [1] 10

tab1["Mus_musculus"]

t2 <-   read.table("tabla2.csv",sep=",",row.names = 1)

t2 <-as.matrix(t2)

str(t2)

t2[,1]

## 5.

## Create these two vectors

Archaea <- c("Crenarchaea", "Euryarchaea")
Bacteria <- c("Cyanobacteria", "Spirochaetes","Acidobacteria")

## Create a list named TreeOfLife so that we can do TreeOfLife$Archaea
## to print the corresponding group

TreeOfLife <- list(A=Archaea,B=Bacteria)
str(TreeOfLife)

TreeOfLife[[2]]

## Update TreeOfLife by adding the following vector:

Eukaryotes <- c("Alveolates", "Cercozoa", "Plants",
                "Opisthokonts")

TreeOfLife[["C"]] <- Eukaryotes
TreeOfLife

## Update Archaea by adding "Actinobacteria"
# $ works for list because each element of the list this nominated

# one option
TreeOfLife$A <- c("Actinobacteria", Archaea)

# other option
TreeOfLife$A <-c(TreeOfLife$A,"Actinobacteria")

TreeOfLife <- list(Archaea, Bacteria,Eukaryotes,Actinobacteria)

str(TreeOfLife)

## (d). Print all the lowest-level taxa

unlist(TreeOfLife, use.names = FALSE)



