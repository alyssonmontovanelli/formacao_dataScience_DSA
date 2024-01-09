
# Criando Matrizes NR = Número de linas
matrix(c(1,2,3,4,5,6), nr = 2)
matrix(c('a', 'B', 'C', 'D', 'e', 'f'), nr = 3)
matrix(c(1,2,3,4,5,6), nr = 6)

# Número de colunas = NC
matrix ( c (1,2,3,4,5,6), nc = 2)

# Help
?matrix


# Criando matrizes a partir de vetores e preenchendo a partir das linhas
meus_dados = c(1:10)
matrix(data = meus_dados, nr = 5, nc = 2, byrow = T)
matrix(data = meus_dados, nr = 5, nc = 2)




# SLICING DE MATRIZ

mat <- matrix(c(1,2,3,4,5), nr = 2)
mat
mat[1]
mat[1,2]
mat[1,3]
mat[,2] # Todos da segunda coluna


# CRIANDO MATRIZ DIAGONAL
matriz = 1:3
matriz
typeof(matriz)
mode(matriz)
diag(matriz)


# Criando vetor da diagnoal
vetor1 = diag(matriz)
diag(vetor1)
vetor1


# Transposta de uma Matriz
W <- matrix(c(2,4,8,12), nr = 2, nc = 2)
W
t(W) # method "t" faz a transposta (linhas viram colunas)


# Operações COM MATRIZES
mat1 <- matrix(c(2,3,4,5), nr = 2)
mat2 <- matrix(c(6,7,8,9), nr = 2)
mat1
mat2
mat1 * mat2
mat1 / mat2


# MÚLTIPLICANDO MATRIZ COM VETOR
x = c(1:4)
y <- matrix(c(1,2,3,4), nr = 2)
x
y
x * y


# NOMEANDO A MATRIZ (Linhas e Colunas) - PODEROSO 
mat3 <- matrix(c("Tetta","Marte", "Saturno", "Netuno"), nr = 2)
mat3
dimnames(mat3) = (list(c("Linha1", "Linha2"), c("Coluna1", "Coluna2")))
mat3


# IDENTIFICANDO LINHAS E COLUNAS NO MOMENTO DA CRIAÇÃO DA MATRIZ
matrix(c(1,2,3,4), nr = 2, nc = 2, dimnames = list(c("Linha 1", "Linha 2"), c("Coluna 1", "Coluna 2")))
# PODEROSO DEMAIS


# COMBINANDO MATRIZES
mat4 <- matrix(c(2,3,4,5), nr = 2)
mat4
mat5 <- matrix(c(6,7,8,9), nr = 2)
mat5
cbind(mat4, mat5) # acrescenta a direita
rbind(mat4, mat5) # acrescenta abaixo


# DESCONSTRUINDO A MATRIZ
c(mat4)

