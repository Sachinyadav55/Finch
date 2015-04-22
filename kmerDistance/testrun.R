
require(Matrix)
library(kmerDistance)
x <- kmerDistance.dif(8,"./data/")


write.csv(x, file = "out.csv")

