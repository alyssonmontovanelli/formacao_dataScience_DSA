setwd("C:/formacao_dataScience_DSA/02_bigData_R_Azure_machineLearning/Cap03_Fatores_EstruturaControle_Funcoes")
getwd()

# HELP 
?sample
args(sample)
args(mean)
args(sd)


# Funções Built-in
abs(-43) # Valor absoluto
sum(c(1:15))
mean(c(1:8))
round(c(1.1:5.8))
rev(c(1:5)) # Ordem inversa
sort(rev(c(1:10)))
append(c(1:6), 6)


vec1 <- c(1.5, 2.5, 8.4, 3.7, 6.3)
vec2 <- rev(vec1)
vec2


# CRIANDO FUNÇÕES

myfunc <- function(x,y){
  return(x+y)
}

myfunc(10,15)

jogar_dados <- function(){
  num <- sample(1:6, size = 1)#local
  num
}

jogar_dados()


# Função sem numerod e parametros
myfunc3 <- function(...){
  df = data.frame(cbind(...))
  print(df)
  View(df)
}

vec1 <- c(10:13)
vec2 <- c("a", "b", "c", "d")
vec3 <- c(6.5, 7.5, 8.7, 1.8)

myfunc3(vec1)
myfunc3(vec1, vec2)
myfunc3(vec1, vec2, vec3)


# MAIS FUNÇÕES BUILT IN

x <- 1:1000000
x


# Função que calcula raiz quadrada de cada elemento
meu_sqrt <- function(numeros){
  resp <- numeric(length(numeros))
  for(i in seq_along(numeros)){
    resp[i] <- sqrt(numeros[i])
  }
  return(resp)
}

system.time(x2a <- meu_sqrt(x))  
system.time(x2b <- sqrt(x))
