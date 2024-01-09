# Variáveis em R

# Criando Variáveis
var1 = 100
print(var1)
mode(var1)
help('mode')
sqrt(var1)
typeof(var1)

# Atribuir valor de variavel em outra variavel
var2 = 55
var2
typeof(var2)
mode(var2)

# Lista de elementos
var3 = c('primeiro', 'segundo', 'terceiro')
# Importante: a função "c" cria um vetor
mode(var3)
typeof(var3)

# Chamando uma função
var4 = function(x){x+3}
var4
mode(var4)

var4(10)

# Mudar o modo do dado
var1
mode(var1)
var5 = as.character(var1)
mode(var5)

# Atribuindo valores a objetos
x <- c(1,2,3)
x 
typeof(x)
mode(x)

c(1,2,3) -> y
y
x1 = c(1,2,3)
x1
mode(x)
mode(x1)
typeof(x)
typeof(x1)

assign("x", c(6.3, 8.9, -6))
x[1]
x

# Verifica objetos
ls() # lista objetos
objects()
