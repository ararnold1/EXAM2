EXAM2


library(gplots)

library(RColorBrewer)

data <- read.csv(file="/Users/Amanda/Desktop/R DATA/Exam2data.csv")

data
                       X With.Estrogen With.Progesterone With.Oxacillin With.Spermidine
1   Mice 1        0.0940            0.6680         0.4153          0.4613
2   Mice 2        0.1138           -0.3847         0.2671          0.1529
3   Mice 3        0.1893            0.3303         0.5821          0.2632
4   Mice 4       -0.0102           -0.4259        -0.5967          0.1800
5   Mice 5        0.1587            0.2948         0.1530         -0.2208
6   Mice 6       -0.4558            0.2244         0.6619          0.0457
7   Mice 7       -0.6241           -0.3119         0.3642          0.2003
8   Mice 8       -0.2270            0.4990         0.3067          0.3289
9   Mice 9        0.7365           -0.0872        -0.0690         -0.4252
10 Mice 10        0.9761            0.4355         0.8663          0.8107

#assign the row names to an object called 'rnames'
rnames <-data[,1]

rnames
[1] Mice 1  Mice 2  Mice 3  Mice 4  Mice 5  Mice 6  Mice 7  Mice 8  Mice 9  Mice 10
Levels: Mice 1 Mice 10 Mice 2 Mice 3 Mice 4 Mice 5 Mice 6 Mice 7 Mice 8 Mice 9

class(data)
[1] "data.frame"

#convert data frame into matrix bc gplots only use on matrix (select 2nd to last column)

mat_data <- data.matrix(data[,2:ncol(data)])

mat_data
      With.Estrogen With.Progesterone With.Oxacillin With.Spermidine
 [1,]        0.0940            0.6680         0.4153          0.4613
 [2,]        0.1138           -0.3847         0.2671          0.1529
 [3,]        0.1893            0.3303         0.5821          0.2632
 [4,]       -0.0102           -0.4259        -0.5967          0.1800
 [5,]        0.1587            0.2948         0.1530         -0.2208
 [6,]       -0.4558            0.2244         0.6619          0.0457
 [7,]       -0.6241           -0.3119         0.3642          0.2003
 [8,]       -0.2270            0.4990         0.3067          0.3289
 [9,]        0.7365           -0.0872        -0.0690         -0.4252
[10,]        0.9761            0.4355         0.8663          0.8107


# assign rownames to the matrix object
rownames(mat_data) <- rnames 

mat_data
        With.Estrogen With.Progesterone With.Oxacillin With.Spermidine
Mice 1         0.0940            0.6680         0.4153          0.4613
Mice 2         0.1138           -0.3847         0.2671          0.1529
Mice 3         0.1893            0.3303         0.5821          0.2632
Mice 4        -0.0102           -0.4259        -0.5967          0.1800
Mice 5         0.1587            0.2948         0.1530         -0.2208
Mice 6        -0.4558            0.2244         0.6619          0.0457
Mice 7        -0.6241           -0.3119         0.3642          0.2003
Mice 8        -0.2270            0.4990         0.3067          0.3289
Mice 9         0.7365           -0.0872        -0.0690         -0.4252
Mice 10        0.9761            0.4355         0.8663          0.8107

# create a color template/palette with function colorRampPalette n=shades

my_palette <- colorRampPalette(c("orange", "green", "blue")) (n=299)

#create a 5*5 inch of image

png("/Users/Amanda/Desktop/R DATA/Exam2_heatmap.png", width=5*300, height=5*300, res=300, pointsize=8)

#Heatmap on this picture -dendrogram clustering

heatmap.2(mat_data, main="Exam2 Heatmap", notecol="black", margins=c(12,9), col=my_palette, dendrogram="row")

dev.off()
