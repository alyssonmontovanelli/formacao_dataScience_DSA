# Demo
demo("graphics")

# Plot básico
x = 5:7
y = 8:10
plot(x,y)


# Altura 
altura <- c(145,167,180,183)
largura <- c(51,63,69,70)
plot(altura, largura)


# Plotanod Dataframe
lynx
plot(lynx)
plot(lynx, col = 'red' ,ylab = 'Plot Dataframe', xlab = "")


library(datasets)
airquality
transform(airquality, Month = factor(Month))
boxplot(Ozone ~ Month, airquality, xlab = 'Month')


# ---- Parâmetro dos gráficos
par()
par('pch')
par('lty')

x = 2:8
plot(x,pch = 'b')


# mesma área de plotagem para os gráficos 
par(mfrow = c(2,2), col.axis = 'red')
plot(1:8, las =0, xlab = 'xlab', ylab = 'ylab', main = 'LAS = 0')
plot(1:8, las =1, xlab = 'xlab', ylab = 'ylab', main = 'LAS = 0')
plot(1:8, las =2, xlab = 'xlab', ylab = 'ylab', main = 'LAS = 0')
plot(1:8, las =3, xlab = 'xlab', ylab = 'ylab', main = 'LAS = 0')
legend('topright', pch = 1, col = c("blue", "red"), legend = c("Var1", "Var2"))


# Cores disponiveis
colors()


# Salvando Gráficos em PNG e PDF
png('Grafico.png', width = 500, height = 500, res = 72)
plot(iris$Sepal.Length, iris$Petal.Length,
     col= iris$Species,
     main = "Gráfico gerado a partir do Iris Flowers")

dev.off()


# PDF
png('Grafico2.pdf', width = 500, height = 500, res = 72)
plot(iris$Sepal.Length, iris$Petal.Length,
     col= iris$Species,
     main = "Gráfico gerado a partir do Iris Flowers")

dev.off()
