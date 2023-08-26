


# Imports
import re
import sys
import copy
import random
import string
import datetime
from random import randrange

# Definindo o número de msg (leituras) que serão geradas
# se nenhum valor for informado, vamos gerar apenas 10 registros
if len(sys.argv) > 1: # argumento de entrada
    num_msg = int(sys.argv[1])
else:
    num_msg = 10


# Temperatura de cada sensor
dict_temp_sensores = {'sensor1': 38.3, 'sensor2': 45.3, 'sensor3': 31.8, 'sensor4': 73.1, 'sensor5': 71.8,'sensor6': 63.7,
                      'sensor7': 80.7 , 'sensor8': 52.0, 'sensor9': 64.1, 'sensor10': 62.7,'sensor11': 73.4, 'sensor12': 54.2,
                      'sensor13': 76.4 , 'sensor14': 49.0, 'sensor15': 50.4,'sensor16': 58.8, 'sensor17': 47.6, 'sensor18': 55.4, 
                      'sensor19': 58.8, 'sensor20': 49.4,'sensor21': 59.9, 'sensor22': 45.1, 'sensor23': 55.1, 'sensor24': 16.6,
                      'sensor25': 42.8,'sensor26': 50.4, 'sensor27': 32.9, 'sensor28': 71.8, 'sensor29': 33.5, 'sensor30': 71.7, 
                      'sensor31': 37.8, 'sensor32': 69.6, 'sensor33': 50.3, 'sensor34': 84.4, 'sensor35': 79.0,'sensor36': 11.0,
                      'sensor37': 64.2, 'sensor38': 57.9, 'sensor39': 60.7, 'sensor40': 58.6,'sensor41': 64.5, 'sensor42': 31.2, 
                      'sensor43': 54.4, 'sensor44': 40.1, 'sensor45': 44.3,'sensor46': 62.7, 'sensor47': 53.4, 'sensor48': 52.4, 
                      'sensor49': 45.6, 'sensor50': 58.4}

# ID base para cada sensor
id_base_sensor = "S-DSA-MP6-CAP15-02468"

# id base para cada equipamento
id_base_equipamento = "E-DSA-MP6-CAP15-13579"

# Formato padrão de leitura do sensor
padrao_leitura = "iot:leitura:sensor:temp"

# Lista de letras do alfabeto em maiúsculo
letras = string.ascii_uppercase
# print(random.choice(letras))

# String com formato de cada leitura de sensor
header_leitura_iot = """
{'id_sensor': '%s',
 'id_equipamento': '%s',
 'sensor':'%s',}
"""

iotmsg_data_evento = """
"data_evento": "%sZ",
"""

iotmsg_formato = """
'padrao': {"formato": "%s", 
"""

iotmsg_dado = """
'leitura': {'temperatura': %.1f}}
"""

# Dicionario de mapeamento do id ao sensor
dic_map_sensor_id = {}

# Dicionario para gravar a temperatura masia tual medida por cada sensor
dic_temperatura_atual = {}

# Gera o arquivo de saída em formato JSON
if __name__ == "__main__":
    
    # Loop de 0 até o número de mensgens (valor definido ao executar o simulador)
    for counter in range(0, num_msg):
        
        # Gera uma combinação com 3 numero randomicos
        rand_num = str(random.randrange(0,9)) + str(random.randrange(0,9)) + str(random.randrange(0,9))

        # Gera uma combinação com 2 letras randomicas
        rand_letter = random.choice(letras) + random.choice(letras)

        #Gera um valor randomico para a temperatura seguindo uma distancia uniforme
        rand_valor_temperatura = random.uniform(-5,5)

        #Gera mais um valor randomico para a temperatura seguindo uma distribuição uniforme
        rand_valor_temperatura_delta = random.uniform(-1,1)

        # O id do sesnor recebe o valor base mais os valores randomicos gerados anteriormente
        id_sensor = id_base_sensor + rand_num + rand_letter

        # O id do equipamento recebe o valor base mais os valores randomicos gerados anteriormente
        id_equipamento = id_base_equipamento + rand_num + rand_letter

        # Seleciona um sensor de forma aleatorica do dicionario de sensores
        sensor = random.choice(list(dict_temp_sensores.keys()))

        if (not id_sensor in dic_map_sensor_id):
            
            #Inclui o sensor na lista
            dic_map_sensor_id[id_sensor] = sensor

            #Inclui a temperatura na lista
            dic_temperatura_atual[id_sensor] = dict_temp_sensores[sensor] + rand_valor_temperatura

        elif (not dic_map_sensor_id[sensor] == sensor):
            sensor = dic_map_sensor_id[id_sensor]

        # Faemos mais um ajuste na temperatura para simular a geração randomica do valor tanto quanto possivel
        temperatura = dic_temperatura_atual[id_sensor] + rand_valor_temperatura_delta
        dic_temperatura_atual[id_sensor] = temperatura

        # Formata a data atual de execução do script para usar como data do evento
        today = datetime.datetime.today()
        data_evento = today.isoformat()

        # Imprime o resultado usando REGEX para gerar o arquivo no formato JSON
        print(re.sub(r"[\s]", "", header_leitura_iot) % (id_sensor, id_equipamento, sensor),
              re.sub(r"[\s]", "", iotmsg_data_evento) % (data_evento),
              re.sub(r"[\s]", "", iotmsg_formato) % (padrao_leitura),
              re.sub(r"[\s]", "", iotmsg_dado) % (temperatura))
        

