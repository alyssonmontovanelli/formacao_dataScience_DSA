setwd("C:/formacao_dataScience_DSA/02_bigData_R_Azure_machineLearning/Cap03_Fatores_EstruturaControle_Funcoes")
getwd()


# ---------------------- EXPRESSÕES REGULARES ---------------------------------# 

str <- c("expressões", "Regulares", "em linguagem R", "permitem a busca por padrões",
         "e explora de textos", "101010121549")
str
length(str)

# grep
grep("ex", str, value = F) # verifica se usa "ex" e volta FALSE para o valor do item, ou seja, retorna só a posição
grep("ex", str, value = T) 
grep("\\d", str, value = F) # encontra digito e retorna posição
grep("\\d", str, value = T) # encontra o valor da posição


# grepl()

grepl("\\d+", str)
grepl("\\D", str) # tudo que é não digito


# GSUB - para substituição 
gsub("res", "*******", str)
gsub("ex", "EX", str, ignore.case = T)


# REGEXPR()
frase <- "Isso é uma String"
regexpr(pattern = "u", frase)


# GSUB() - encontra o valor, REMOVE

str2 <- c("2678 é maior que 45 - @#$%¨$@#$#", "Vamos escrever 14 scripts em R")
gsub("\\d", "", str2) # remove numeros
gsub("\\D", "", str2) # remove o que não for número
gsub("\\s", "", str2) # retira todos os espaços 
gsub("[iot]", "Q", str2)

# TEM UM BIZUROMETRO NA PASTA DE DADOS DO CURSO