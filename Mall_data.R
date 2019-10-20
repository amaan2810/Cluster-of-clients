#importing the dataset
dataset <- read.csv('Mall_Customers.csv')
X <- dataset[4:5]
#using elbow method find the optimal number of clusters
set.seed(6)
wcss <- vector()
for (i in 1:10) 
  { wcss[i] <- sum(kmeans(X,i)$withinss)
}
plot(1:10, wcss, type='b', main=paste('Clusters of Clients'), xlab='Number of Clusters', ylab='WCSS')

#applying k-means to the dataset
set.seed(29)
kmeans <- kmeans(X, 5, iter.max = 300, nstart = 10)

#visualizing the clusters
#install.packages('cluster')
library(cluster)
clusplot(
  X,
  kmeans$cluster,
  lines = 0,
  shade = TRUE,
  color = TRUE,
  labels = 2,
  plotchar = FALSE,
  span = TRUE,
  main = 'Cluster of clients',
  xlab = 'Annual Income',
  ylab = 'Spending score'
)