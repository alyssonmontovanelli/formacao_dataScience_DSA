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
modelo_base <- lm(tip ~ total_bill, data = tips)
modelo_fit <- data.frame(
  total_bill = tips$total_bill,
  predict(modelo_base, interval = "confidence")
)

head(modelo_fit)


# Camada 2 
camada2 <- geom_line(
  mapping = aes(x = total_bill, y = fit),
  data = modelo_fit,
  color = 'darkgreen'
)
ggplot() + camada1 + camada2


# Camada 3
camada3 <- geom_ribbon(
  mapping = aes(x = total_bill, ymin = lwr, ymax = upr),
  data = modelo_fit,
  alpha = 0.4
)
ggplot() + camada1 + camada2 + camada3

#------------------#-###------------- 

# VERSÃO FINAL COM OTIMIZAÇÃO
ggplot(tips, aes(x = total_bill, y = tip)) +
  geom_point(aes(color = sex)) +
  geom_smooth(method = 'lm')


### ------------- Scaterplot com linha de regressão

# Dados
data = data.frame(cond = rep(c("Obs 1", "Obs 2"),
                             each = 10), var1 = 1:100 + 
                    rnorm(100, sd = 9), var2 = 1:100 +
                    rnorm(100, sd = 16))
# Plotagem
ggplot(data, aes(x = var1, y = var2)) +
  geom_point(shape = 1) +
  geom_smooth(method = , color = "red", se = FALSE)

# --------------- Bar Plot

# Dados
data = data.frame(grupo = c('A', 'B', 'C', 'D'),
                  valor = c(33,62,56,67),
                  num_obs = c(100, 500, 459, 340))

# Gerando massa de dados
data$right = cumsum(data$num_obs) + 30 * c(0:(nrow(data)-1))
data$left = data$right - data$num_obs
data
