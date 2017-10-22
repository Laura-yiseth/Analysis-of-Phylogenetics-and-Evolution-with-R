## Laura Yiseth Galvis Tuesta
## Lauraygt8gmail
## GPL2.X
## Universidad Industrial de Santander (Bucaramanga).
## Create tree

############# Exercise ####################

# How to create this tree of zero? 

treeRef <- read.tree(text = "((E,(D,C)),(B,A));")
plot(treeRef)

# a tree need this structure basic

# edge: this is the matrix of points of connection between the nodes
# in this case are eight points because treeRef is a bifurcated tree with five 
# terminals (2n-2).
edge <- matrix(NA,nrow =8,ncol = 2) 
edge[,1] <- c(6,7,7,8,8,6,9,9) 
edge[,2] <- c(7,1,8,2,3,9,5,4)

# Nnode: numbers of internal nodes (n-1).
Nnode <- 4

# names of terminals, this isn't important.
tip.label <- c("e","d","c","a","b")

# Now I create a list with all the objects.
tree <- list(edge=edge, Nnode=Nnode, tip.label=tip.label)

# And assign class "phylo" to my list.
class(tree) <- "phylo"

# Check that the structure of my tree is fine.
str(tree)

# and ready, I have my tree made since zero.
plot(tree)


