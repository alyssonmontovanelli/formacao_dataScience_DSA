setwd("C:/formacao_dataScience_DSA/02_bigData_R_Azure_machineLearning/Cap03_Fatores_EstruturaControle_Funcoes")
getwd()

# Teste


for(i in 1:10){
  print('OI')
}


x = 3
if (x<5){
  print("Menor")
}

# IF ELSE ELSE IF
z = 7 

if (z > 8){
  "Este numero é maior que 8"
} else if (z == 8){
  "Este numero é igual a 8"
} else{
  "Número é menor que 8"
}

# IFELSE
y = 5
ifelse(y > 6, "Correto", "Errado")


# IFELSE ANINHADO
numero = 10 
ifelse(numero == 20, "Número é igual a 20",
       ifelse(numero == 10, "Igual a 10"," Número diferente de 10 e 20"))

# ESTRUTURA E CONTROLE DENTRO DE FUNÇÕES
func1 <- function(x,y){
  ifelse(y<7, x+y, "Não encontrado")
}

func1(4,2)
func1(8,9)


# REP
rep(rnorm(10),5) # RNORM cria distribuição normal
rep("Botafogo",10)

# Loop For
for(i in 1:20) {
  print(i)
  if (i == 15){
    break
  }}

for(q in rnorm(10)){print((q))}


# IGNORANDO ALGUNS ELEMENTOS
for(i in 1:22){
  if(i == 13 | i == 15){
    next
  }
  print(i)
}