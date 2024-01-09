# VETOR 
# 1 dimensão e 1 tipo de dado
vetor1 <- c(1:20)
vetor1
length(vetor1)
mode(vetor1)
class(vetor1)
typeof(vetor1)


# Matriz: possui 2 dimensões e 1 tipo de dado
matriz1 <- matrix(1:20, nrow = 4)
matriz1
length(matriz1)



# Array: Possui 2 ou mais dimensões e 1 tipo de dado 
array1 <- array(1:5, dim = c(3,3,3))
array1
length(array1)
mode(array1)
typeof(array)


# DATAFRAME - Dados de diferentes tipos
View(iris)
length(iris)
mode(iris)
typeof(iris)
class(iris)

# LISTAS: Coleção de diferentes objetos
lista1 = list(a = vetor1, b= matriz1)
lista1
length(lista1)
mode(lista1)
typeof(lista1)


# Funções também são objetos em R
func1 <- function(x){
  var1 <- x * x
  return(var1)
}

func1(5)
class(func1)



# Removendo os objetos
objects()
rm(array1, func1)
objects()
