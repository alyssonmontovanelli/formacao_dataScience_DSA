# OPERAÇÃO COM VETORES


# Vetor de String
vetor_char = c('Data', 'Science', 'Academy')
vetor_char

# Vetor de Floats
vetor_numeric = c(1.90, 2.54, 3.31)
vetor_numeric

# Vetor de valores complexos
vetor_complexo = c(5.2+3i, 3.8+4i)
vetor_complexo

# Vetor de valores logicos
vetor_logico = c(TRUE,TRUE,FALSE,TRUE,TRUE,FALSE)
vetor_logico

#vetor de numeros inteiros
vetor_integer = c(2,10,29)
vetor_integer
mode(vetor_integer)
typeof(vetor_integer)
vetor_integer = as.integer(vetor_integer)
typeof(vetor_integer)


# Utilizando a função seq()
vetor1 = seq(1:10)
vetor2 = c(1:10)
vetor1
vetor2


# Utilizando a função rep()
vetorRep = rep(1:5)
vetorRep
is.vector(vetorRep)


# Indexação de vetores com R
a <- c(1,2,3,4,5,6)
a[1]
a[-1]


# Combinação de vetores
v1 = c(1,2,3,4.5)
v2 = c('a', 'b', 'c')

c(v1,v2)


# Opeações com vetores
x = c(1,3,5,7)
y = c(2,4,6,8)

x/5
x+y
x-y


# Somando vetores com numero diferente de elementos
alfa = c(10,20,30)
beta = c(1,2,3,4,5,6,7,8,9)
alfa + beta


#### NOMEANDO UM VETOR com a função 'names()'
v = c("Nelson", "Mandela")
v
names(v) = c('Nome', 'Sobrenome')
v
v['Nome']

nomeTeste = c("Alysson", "Melo")
nomeTeste
names(nomeTeste) = c('Nome', 'Sobrenome')
nomeTeste
nomeTeste['Nome']
