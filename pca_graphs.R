#community dectection with PCA on modularity matrix

library('igraph')

zkc <- graph.famous("Zachary")

plot(zkc)

com_zkc <- leading.eigenvector.community(zkc)

gcols = c("#ca0020","#bababa","#f4a582","#404040")

plot(com_zkc, zkc, col = gcols[com_zkc$membership], mark.col = paste0(gcols,"75"), mark.border = gcols, mark.expand = 1, vertex.label.color="#ffffff",edge.color="black", edge.lty=c(3,1)[crossing(com_zkc,zkc)+1], edge.width = c(1,2)[crossing(com_zkc,zkc)+1])

#plotting 1d geographic position using PCA

library("maptools")

tx <- readShapePoly("tx_county/tl_2008_48_cousub.shp")

lat_long <- coordinates(tx)

pc_lat_long <- princomp(lat_long)

colors<- colorRampPalette(c("#fff7fb","#74a9cf","#023858"), space = "Lab")

PC1_score <- pc_lat_long$scores[,1]
col_score <- PC1_score - min(PC1_score) + 1
cols <- colors(max(col_score))

plot(tx, col = cols[col_score])