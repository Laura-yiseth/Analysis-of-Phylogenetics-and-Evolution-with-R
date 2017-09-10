
## Laura Yiseth Galvis Tuesta
## Lauraygt8gmail
## GPL2.X
## Universidad Industrial de Santander (Bucaramanga).
## Book: Analysis of Phylogenetics and Evolution with R. 2° Edi.
## Author: Emmanuel Paradis
## Third chapter: Phylogenetic Data in R


###################### 3.9 Exercises ###############################

install.packages("ape")

library(ape)

## 1. Create a random tree with 10 tips.
tree <- rtree(10)

## (a) Extract the branch lengths, and store them in a vector.
lon <- tree$edge.length

## (b) Delete the branch lengths, and plot the tree.
tree$edge.length <- NULL
plot(tree)
plot.phylo(tree, use.edge.length = T, show.node.label = T)


## (c) Give new, random branch lengths from a uniform distribution U [0, 10].

# Just for this case 
tree$edge.length <- runif(18,0,10)

# Do this in a way that works for any number of tips.
tree$edge.length <- runif(dim(tree$edge)[1], 0, 10)

# or this
tree$edge.length <- runif(length(tree$edge[,1]), 0, 10)


## (d) Restore the original branch lengths of the tree.
tree$edge.length <- lon


## 2. Create a random tree with 5 tips, print it, and plot it.
tr5 <- rtree(5)
print(tr5)
plot(tr5)

## Find the way to delete the class of this object, and print it again. Try to plot it again:
class(tr5) <- NULL
print(tr5)
str(tr5)

# Changes the structure of the tree. now it's a list.
str(tr5)
plot(tr5)


## comment on what happens. 
# the generic function plot uses the default is
# function plot.default which is inappropriate for the present data structure. 

## Find a way to force the plot of the tree as before.

#Did not work
plot.phylo(tr5)

# return class phylo

#Did not work
tr6 <- as.phylo(class(tr5))

# this is the right way
class(tr5) <- "phylo"
str(tr5)
plot(tr5)


# when is a object multiphylo
MyTMP1 <- list()

MyTMP1[[1]] <- rtree(10)
MyTMP1[[2]] <- rtree(10)

class(MyTMP1) <- "multiPhylo"

str(MyTMP1)

plot.multiPhylo(MyTMP1)


## 3.

## Generate three random trees with 10 tips. 
tree3 <- rmtree(3,10)

## Write them in a file.
write.tree(tree3,file ="tree3")

##Read this file in R. 
readtree <- read.tree("tree3")

##Print a summary of each tree.
summary("tree3")
lapply(readtree, summary)


## Write a small program that will do these operations for any number of trees (say N) and any number of tips (n).


create.Tree <- function(numTree=1,numTer=3,file="nameFile"){
  
  miArbolito <- rmtree(numTree,numTer);
  
  write.tree(miArbolito,file)
  
  return(miArbolito)
  
}

create.Tree(numTree = 2,numTer = 5,file = "hola2")


## 5.

## Extract the sequences of the cytochrome b gene with the accession numbers U15717–U15724 (source: [116]).

# (a) Print the species names of each sequence.

#  example for a single access number

# Extract the sequence 
OneSec <- read.GenBank(access.nb = "U15717", species.names = TRUE)

# see attributes of an object, for example "species" 
attr(OneSec,"species")

# now for several sequences

numSec <- paste("U157",17:24, sep = "")

secGenbank <- function(accNumber="U15717"){

secU11.24 <- read.GenBank(access.nb =numSec,species.names = TRUE)

attr(secU11.24,"species")

return(secU11.24)
}

secGenbank()

# Read sequences 
library(ape)
misDaticos <- read.GenBank(numSec)

str(misDaticos)


# see species names
names <- attr(misDaticos,"species")


# extract a sequence

misDaticos1 <- misDaticos$U15717
str(misDaticos1)

## (b) Print, with a single command, the length of each sequence.
lapply(misDaticos, length)

## (c) Arrange the data in a matrix.

# not work
miPseudoAlin <- as.alignment(misDaticos)
str(miPseudoAlin)

write.nexus(miPseudoAlin, file = "miPseudoALin")

write.nexus(misDaticos,file = "misDaticos")

# this is a matrix for exporting, but not for working R
write.dna(misDaticos,file = "misDaticosFasta", format = "fasta")

# convert from numbers to letters
miSpeudoChar <- as.character(misDaticos)

str(miSpeudoChar)


## (d) Extract and store in three matrices the first, the second, and the
## third codon positions of all sequences. Compute their base frequencies.
## What do you conclude?


# first, I convert the data to data.frame
secDataFrame <- as.data.frame(miSpeudoChar)
str(secDataFrame)

# Now create a vector to extract each position
firstPositionCodon <- seq(1,1045, by=3)
secondPositionCodon <- seq(2,1045, by=3)
thirdPositionCodon <- seq(3,1045, by=3)


# write matrix for the first position, in fasta format

# first install package "seqinr"
install.packages("seqinr") 

# charge the library
 library("seqinr")

# write matrix with the species names  
write.fasta(secDataFrame[firstPositionCodon,],names = names,file.out = "PrimeraPosición")

# now for the second position
write.fasta(secDataFrame[secondPositionCodon,],names = names,file.out = "SegundaPosicion")

# and third position
write.fasta(secDataFrame[thirdPositionCodon,],names = names,file.out = "TerceraPosicion")

