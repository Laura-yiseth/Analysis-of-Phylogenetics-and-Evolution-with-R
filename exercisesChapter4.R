## Laura Yiseth Galvis Tuesta
## Lauraygt8gmail
## GPL2.X
## Universidad Industrial de Santander (Bucaramanga).
## Book: Analysis of Phylogenetics and Evolution with R. 2° Edi.
## Author: Emmanuel Paradis
## Fourth chapter: Plotting Phylogenies


###################### 4.6 Exercises ###############################

## 1. Draw Fig. 4.11 using a color scale in place of the grey one. The figure
## should include a legend.

# loading the library
library(ape)

# reading the tree
tr <- read.tree("tr")
plot(tr)
# now put the labels 
a <- c("alpicola","uralensis","flavicolis","sylvaticus","hermonensis","mystacinus","peninsulae","semotus","agrarius","minutus")
Apodemus <- paste("Apodemus ",a[1:9], sep = "")  
tr$tip.label <- c(Apodemus,"Tokudaia minutus","Mus musculus","Mus caroli","Rattus norvegicus","Diplothrix legata")
tr$tip.label

# Adding bootstrap values
bs.ml <- c(88,76,73,71,100,45,81,72,67,63,100,100)

# I first create a vector of mode character and assign strings with respect to the
# original bootstrap values according to the rules defined above.  
co <- c("blue", "lightblue", "white")
p <- character(length(bs.ml))
p[bs.ml >= 90] <- co[1]
p[bs.ml < 90 & bs.ml >= 70] <- co[2]
p[bs.ml < 70] <- co[3]

# plot the tree and call nodelabels
# The option bg to ignore the first value of p (which is actually an empty string)
# pch specify the symbol to use

plot(tr, no.margin = TRUE)
nodelabels(node = 16:27, pch =21, bg = p[-1], cex = 2)


# now add the legend

legend("bottomleft", legend = expression(90 <= BP,
                                         70 <= BP * " < 90", BP < 70), pch = 21,
       pt.bg = co, pt.cex = 2, bty = "n", title = "Relaciones filogeneticas de Rodentia")


# other way, but this no work

tr2 <- rtree(10)

# Adding bootstrap values
vNodos <- (rnorm(9,0.4,0.3))

# plot the tree
plot(tr2)
nodelabels(round(vNodos,2))           
           
# create the rules of decision 
ncolor <- c("blue","red","cyan")
vNodos[(vNodos < 0.5)] <- ncolor[1]
vNodos[(vNodos > 0.7)] <- ncolor[2]
vNodos[(vNodos < 0.7)] <- ncolor[3]

# plot the tree
plot(tr2)
nodelabels(vNodos)




# other way
# this way works :)
p <- vNodos
p[(vNodos < 0.5)] <- ncolor[1]
p[(vNodos > 0.5 & vNodos < 0.7)] <- ncolor[2]
p[(vNodos > 0.7)] <- ncolor[3]

plot(tr2)
nodelabels(bg=p, pch=21)
  

## 2. Plot the phylogeny of avian orders, and color the Proaves in blue
# Proaves in a box
  
bird <- data("bird.orders")
plot(bird.orders, font = 1, no.margin = TRUE, draw = FALSE)
rect(1.2, 0.5, 36, 5.4, col = "blue")
par(new = TRUE)
plot(bird.orders, font = 1, no.margin = TRUE)

#  node
plot(bird.orders)
nodelabels(node =25,bg="blue", pch=21)

# node with text
bird <- data("bird.orders")
plot(bird.orders, font = 1, no.margin = TRUE, draw = FALSE)
nodelabels("Proaves",25, frame = "c", bg = "blue", cex=4)

##  Repeat this but only for the terminal branches of this clade.  

proaves <- which.edge(bird.orders, 1:5)
colo <- rep("black", Nedge(bird.orders))
colo[proaves] <- "blue"
plot(bird.orders, edge.color =colo)

## 3. Suppose you have a factor representing a character state for each node
## and each tip of a tree. Find a way to associate a color with each branch
## depending on the state at both ends of the branch.

# example with 3 tip labels
tree2 <- rtree(3)
a <- which.edge(tree2,c(2,3))
b <- which.edge(tree2,1)
edge <- c(a,b)
plot.phylo(tree2, edge.color=edge, edge.width=5)

# now, taking into account the transformations and edge
tree2 <- rtree(3)
plot.phylo(tree2, edge.color=color, edge.width=5)

# the colors are according to the edge rows
color <- c("blue","red","yellow","pink")


# other example 
tree6 <- read.tree(text = "(((1,2),3),((4,5),6));")
tree6$edge
col <- c("red","red","blue","blue","blue","red","red","blue","blue","blue")
plot.phylo(tree6,edge.color = col, edge.width = 5)  

#############################
f <- which(tree2$edge[,2]>4)
##############################

