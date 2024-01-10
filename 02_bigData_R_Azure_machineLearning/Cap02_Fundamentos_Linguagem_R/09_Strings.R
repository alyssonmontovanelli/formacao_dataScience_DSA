#------------------------STRINGS---------------------------------------|

# String
texto = "Botafogo campeão 2024"
texto
mode(texto)

x = as.character(3.14)
x

# Concatenação de Strings
nome = "Alysson"; sobrenome = "Montovanelli"
nomeCompleto <- paste(nome,sobrenome)
nomeCompleto

# Formatando saída
sprintf("A %s é nota %d", "Data Science Academy", 10) # primeiro string dps numeric

# Slicing de string
texto <- "Isso é string"
substr(texto, start = 12, stop = 16)

# Contando o número de caracteres
nchar(texto)

library(stringr)

# Dividindo a string em caracteres
strsplit("Testando o split em string", NULL)

# Utilizando espaço para separar a frase
strsplit("Botafogo campeão brasileiro de 2023", " ")


# Trabalhando com Strings

string1 <- c("Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum ")
string1

string2 <- c("Botafogo Botafogo Botafogo Botafogo Botafogo R", "Testeando teste doido")
string2

string3 <- c("Testando", "Botafogo")
string3

# Adicionando 2 Strings 
str_c(c(string1, string2), sep ="")


# detectando ocorrências na string
str_detect("Hoje vou ali na penha", "p") # TRUE

# Contando ocorrência em uma string
str_count(string1, 'L')


# Localizando a primeira ocorrência de uma letra
str_locate_all("Hoje o povo vai viajar e encontrarei eles amanhã", "a")
str_count(string2, "a")


# SUBSTITUI CARACTERE
str_replace("Testando Teste", " ", "")

# SUBSTITUI A PRIMEIRA OCORRENCIA
str_replace("Testando Teste HDUAS ASDHU ddd", "\\s", "")

# SUBSTITUI TODAS AS OCORRENCIAS
str_replace_all("Testando Teste HDUAS ASDHU ddd", "\\s", "-")
