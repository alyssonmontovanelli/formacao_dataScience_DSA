install.packages('ggplot2')
library(ggplot2)

# Plotando um grfico básico com qplot()
data(tips, package = 'reshape2')
View(tips)
qplot(total_bill, tip, data = tips, geom = "point")


# Camada 1
camada1 <- geom_point(
  mapping = aes(x = total_bill, y = tip, color = sex),
  data = tips,
  size = 3
)
ggplot() + camada1

# aes =  mapeando a estética 

# Camada 2
# Construindo um modelo de regressão linear
