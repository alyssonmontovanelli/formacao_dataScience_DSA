
# ------------------ LISTAS -----------------------------# 

# listas de String
lista1 = list('A', 'B','C')
lista1
lista2 <- list(c("A", "A"), "b", 'c')
lista2
lista3 = list(matrix(c("A", "B", "C", "D"), nr = 2), "T", "V")
lista3


# Lista inteiros
lista_inteiros = list(2,3,4)
lista_inteiros

# Lista de floats
lista_float = list(1.3, 4.4, 5.5)
lista_float


#lista valores lógicos
lista_bol <- list(TRUE, TRUE, FALSE, FALSE)
lista_bol



# Lista composta

composta = list(1,'A',TRUE) # Diferentes tipos
composta



# LISTA NORMALIZADA (Distribuição normal dos valores)
lista4 <- list(1:10, c("A", 'B'), rnorm(10))
lista4


# slicing
lista4[1]
lista4[2]
lista4[[2]][1]
lista4[[2]][1] = 'Alysson' # mudar valor do elemento


lista4


# Nomear os elementos - lista nomeada
names(lista4) <- c("inteiros", "caracteres", "numericos")
lista4


# Nomear elementos diretamente na criação das listas
lista2 <- list(elemento1 = 3:5, elemento2 = c(7.2,3.5))
lista2

# Elementos específicos da lista
names(lista4) <- c("inteiros", "caracteres", "numercios")
lista4

lista4$caracteres
lista4$inteiros

length(lista4)


# Combinando duas listas
lista3 <- c(lista1, lista2)
lista3
