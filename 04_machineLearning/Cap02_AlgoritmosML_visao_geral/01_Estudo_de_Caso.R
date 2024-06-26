# Carregando dados
dataset_bank <- read.table("C:/formacao_dataScience_DSA_DADOS/04_machineLearning/Cap02/bank/bank-full.csv",
                           header = TRUE, sep = ";")
# Visualizar os dados
View(dataset_bank)

# função table() para conhecer melhor os dados
table(dataset_bank$job)

# Visualizando os valores da tabela de forma gráfica
library(dplyr)
library(ggplot2)

dataset_bank %>%
  group_by(job)%>%
  summarise(n = n())%>%
  ggplot(aes(x = job, y = n))+
  geom_bar(stat = "identity")+
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Adicionando nova coluna ao conjunto de dados com o mutate()
dataset_bank <- dataset_bank %>%
  mutate(technology_use = 
           case_when(job == 'admin' ~ 'medio',
                     job == 'blue-collar' ~ 'baixo',
                     job == 'entrepreneur' ~ 'alto',
                     job == 'housemaid' ~ 'baixo',
                     job == 'management' ~ 'medio',
                     job == 'retired' ~ 'baixo',
                     job == 'self-employed' ~ 'baixo',
                     job == 'services' ~ 'medio',
                     job == 'student' ~ 'alto',
                     job == 'technician' ~ 'alto',
                     job == 'unemployed' ~ 'baixo',
                     job == 'unknown' ~ 'baixo'))
View(dataset_bank)


# PLotando nova coluna
dataset_bank %>%
  group_by(technology_use)%>%
  summarise(n = n())%>%
  ggplot(aes(x = technology_use, y = n))+
  geom_bar(stat = "identity")+
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


######################################################
# Encoder para a coluna default - coluna com 2 possibilidades
dataset_bank <- dataset_bank %>%
  mutate(defaulted = ifelse(default == 'yes', 1, 0))

View(dataset_bank)


######################################################
# One Hot ENCONDING utilizando pacote CARET

library(caret)
dmy <- dummyVars(" ~ .", data = dataset_bank)
bank.dummies <- data.frame(predict(dmy, newdata = dataset_bank))

View(bank.dummies)


########################################################
# SUMARIZAR - juntar informações de variaveis em outra 

dataset_bank %>%
  group_by(job, marital)%>%
  summarise(n = n())


dataset_bank %>%
  group_by(job, marital) %>%
  summarise(n=n()) %>%
  ggplot(aes(x = job, y = n, fill = marital))+
  geom_bar(stat = 'identity', position = 'dodge')+
  theme(axis.text.x = element_text(angle = 60, hjust = 1))

# Utilizando dummyVars nesse conjunto sumarizado
dmy <- dummyVars( ~ job:marital, data = dataset_bank)
bank.cross <- predict(dmy, newdata = dataset_bank)
View(bank.cross)
