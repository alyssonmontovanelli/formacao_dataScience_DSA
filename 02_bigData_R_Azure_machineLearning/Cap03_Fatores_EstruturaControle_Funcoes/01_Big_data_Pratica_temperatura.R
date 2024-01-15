setwd("C:/formacao_dataScience_DSA/02_bigData_R_Azure_machineLearning/Cap03_Fatores_EstruturaControle_Funcoes")
getwd()

install.packages("readr")
install.packages("data.table")
install.packages("dplyr")
install.packages("ggplot2")

library(readr)
library(dplyr)
library(ggplot2)
library(scales)
library(data.table)



# Carregando os dados (Usando um timer para comparar o tempo de carregamento com diferentes funções)

# Usando read.csv2()
system.time(df_teste1 <- read.csv2("C:/formacao_dataScience_DSA_DADOS/02_bigData_R_Azure_ML/Cap03_Fatores_estruturas_funcoes/TemperaturasGlobais.csv"))


# Usando read.table()
system.time(df_teste2 <- read.table("C:/formacao_dataScience_DSA_DADOS/02_bigData_R_Azure_ML/Cap03_Fatores_estruturas_funcoes/TemperaturasGlobais.csv"))


# Usando fread() - Forma de carregar os dados de maneira rápida e amigável
??fread
system.time(df <- fread("C:/formacao_dataScience_DSA_DADOS/02_bigData_R_Azure_ML/Cap03_Fatores_estruturas_funcoes/TemperaturasGlobais.csv"))


# Criando subsets dos dados carregados
cidadesBrasil <- subset(df, Country == 'Brazil')
cidadesBrasil <- na.omit(cidadesBrasil)
head(cidadesBrasil)
View(cidadesBrasil)
nrow(df)
nrow(cidadesBrasil)
dim(cidadesBrasil)


# Preparação e Organização

# Convertendo as Datas
cidadesBrasil$dt <- as.POSIXct(cidadesBrasil$dt,format='%Y-%m-%d')
cidadesBrasil$Month <- month(cidadesBrasil$dt)
cidadesBrasil$Year <- year(cidadesBrasil$dt)
View(cidadesBrasil)

# Carregando os subsets

# Palmas
plm <- subset(cidadesBrasil, City == 'Palmas')
plm <- subset(plm, Year %in% c(1796,1846,1896,1946,1996,2012))

# Curitiba
crt <- subset(cidadesBrasil, City == 'Curitiba')
crt <- subset(crt, Year %in% c(1796,1846,1896,1946,1996,2012))

# Recife
recf <- subset(cidadesBrasil, City=='Recife')
recf <- subset(recf,Year %in% c(1796,1846,1896,1946,1996,2012))


# Construindo os Plots
p_plm <- ggplot(plm, aes(x = (Month), y = AverageTemperature, color = as.factor(Year))) +
  geom_smooth(se = FALSE,fill = NA, size = 2) +
  theme_light(base_size = 20) +
  xlab("Mês")+
  ylab("Temperatura Média") +
  scale_color_discrete("") +
  ggtitle("Temperatura Média ao longo dos anos em Palmas") +
  theme(plot.title = element_text(size = 18))

p_crt <- ggplot(crt, aes(x = (Month), y = AverageTemperature, color = as.factor(Year))) +
  geom_smooth(se = FALSE,fill = NA, size = 2) +
  theme_light(base_size = 20) +
  xlab("Mês")+
  ylab("Temperatura") +
  scale_color_discrete("") +
  ggtitle("Temperatura Média ao longo dos anos em Curitiba") +
  theme(plot.title = element_text(size = 18))

p_recf <- ggplot(recf, aes(x = (Month), y = AverageTemperature, color = as.factor(Year))) +
  geom_smooth(se = FALSE,fill = NA, size = 2) +
  theme_light(base_size = 20) +
  xlab("Mês")+
  ylab("Temperatura Média") +
  scale_color_discrete("") +
  ggtitle("Temperatura Média ao longo dos anos em Recife") +
  theme(plot.title = element_text(size = 18))


# Plotando
p_plm
p_crt
p_recf
