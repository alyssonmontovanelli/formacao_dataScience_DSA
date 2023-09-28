# Primeiros passos com R

getwd() # Visualiza diretório

license() # licença

sessionInfo() # Resumo sobre a sessão

print('Estou iniciando os estudos com a linguagem R')

# Criando gráfico
plot(1:25)

# Instalando pacotes
install.packages('randomForest')
install.packages('ggplot2')
install.packages('dplyr')
install.packages('devtools')

# Carregando pacote da memória
library(ggplot2)

# Descarregar o pacote 
detach(package:ggplot2)

# Se souber o nome da função 
help(sum)
?sum

# Para buscar mais opçoes sobre uma função, podemos utilizar o SOS
install.packages("sos")
library(sos)
findFn("fread")

# Se souber o nome da função
help.search('randomForest')
help.search('matplot')
??matplot # Outra forma de chamar o help
RSiteSearch('matplot')
example('matplot') # Exemplo de utilização da função matplot


# Sair
q()
