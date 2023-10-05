# Numeric - todos os numeros criados em R são do tipo Numeric
num1 <- 7

num1
class(num1)
mode(num1)
typeof(num1)

num2 = 16.89
num2
typeof(num2)


# Integer
# Convertendo tipo numeric para integer
is.integer(num2)
y = as.integer(num2)
class(y)
mode(y)
typeof(y)

as.integer('3.14')
as.integer('Joe')
as.integer(TRUE)
as.integer(FALSE)



# cHARACTER
char1 = 'A'
char1
mode(char1)
typeof(char1)

char2 = 'Data Science'
char2

char3 = c('Data', 'Science', 'Academy')
char3
mode(char3)
typeof(char3)


# Complexo
compl = 2.6 + 4i
compl

sqrt(-1)


# Logic
x = 1; y = 2
z = x > y
z
class(z)


u = TRUE ; v = FALSE
class(u)
u & v
u | v
!u
