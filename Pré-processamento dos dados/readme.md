## Pré-processamento dos arquivos CSV com script ETL Python
#### Os dados fornecidos pela TabNet não são normalizados e os equipamentos listados no resultado vêm em inúmeras colunas, totalizando 56. No entanto, foi necessário criar um script ETL (Extract, Transform and Load) dentro da plataforma Jupyter (linguagem Python), a fim de transformar e mesclar os arquivos CSV.

![image](https://user-images.githubusercontent.com/83841974/133791990-cc7ec434-51b3-4f87-9cd4-06d51d8cca74.png) 

<a name="subtitulo_b"></a>
  1. [Elaboração do script](#subtitulo_b)
  ##### Definição de biblioteca para tratamento de dados (Pandas) e criação de dataframes para leitura de arquivos CSV (04 pastas de arquivos).
  ```
  import pandas as pd       #Importando biblioteca Pandas para transformação de dados
  
  df1 = pd.read_csv('C:/Users/danie/sus_em_uso/estadual_19/estadual_em_uso_jan_19.csv',encoding='UTF-8',sep=";")  #Dataframes da pasta (em uso: estadual 19) - jan a dez/19        
  df2 = pd.read_csv('C:/Users/danie/sus_em_uso/estadual_19/estadual_em_uso_fev_19.csv',encoding='UTF-8',sep=";")
  df3 = pd.read_csv('C:/Users/danie/sus_em_uso/estadual_19/estadual_em_uso_mar_19.csv',encoding='UTF-8',sep=";")
  df4 = pd.read_csv('C:/Users/danie/sus_em_uso/estadual_19/estadual_em_uso_abr_19.csv',encoding='UTF-8',sep=";")
  df5 = pd.read_csv('C:/Users/danie/sus_em_uso/estadual_19/estadual_em_uso_mai_19.csv',encoding='UTF-8',sep=";")
  df6 = pd.read_csv('C:/Users/danie/sus_em_uso/estadual_19/estadual_em_uso_jun_19.csv',encoding='UTF-8',sep=";")
  df7 = pd.read_csv('C:/Users/danie/sus_em_uso/estadual_19/estadual_em_uso_jul_19.csv',encoding='UTF-8',sep=";")
  df8 = pd.read_csv('C:/Users/danie/sus_em_uso/estadual_19/estadual_em_uso_ago_19.csv',encoding='UTF-8',sep=";")
  df9 = pd.read_csv('C:/Users/danie/sus_em_uso/estadual_19/estadual_em_uso_set_19.csv',encoding='UTF-8',sep=";")
  df10 = pd.read_csv('C:/Users/danie/sus_em_uso/estadual_19/estadual_em_uso_out_19.csv',encoding='UTF-8',sep=";")
  df11 = pd.read_csv('C:/Users/danie/sus_em_uso/estadual_19/estadual_em_uso_nov_19.csv',encoding='UTF-8',sep=";")
  df12 = pd.read_csv('C:/Users/danie/sus_em_uso/estadual_19/estadual_em_uso_dez_19.csv',encoding='UTF-8',sep=";")
  
  df13 = pd.read_csv('C:/Users/danie/sus_em_uso/municipal_19/municipal_em_uso_jan_19.csv',encoding='UTF-8',sep=";") #Dataframes da pasta (em uso: municipal 19) - jan a dez/19
  df14 = pd.read_csv('C:/Users/danie/sus_em_uso/municipal_19/municipal_em_uso_fev_19.csv',encoding='UTF-8',sep=";")
  df15 = pd.read_csv('C:/Users/danie/sus_em_uso/municipal_19/municipal_em_uso_mar_19.csv',encoding='UTF-8',sep=";")
  df16 = pd.read_csv('C:/Users/danie/sus_em_uso/municipal_19/municipal_em_uso_abr_19.csv',encoding='UTF-8',sep=";")
  df17 = pd.read_csv('C:/Users/danie/sus_em_uso/municipal_19/municipal_em_uso_mai_19.csv',encoding='UTF-8',sep=";")
  df18 = pd.read_csv('C:/Users/danie/sus_em_uso/municipal_19/municipal_em_uso_jun_19.csv',encoding='UTF-8',sep=";")
  df19 = pd.read_csv('C:/Users/danie/sus_em_uso/municipal_19/municipal_em_uso_jul_19.csv',encoding='UTF-8',sep=";")
  df20 = pd.read_csv('C:/Users/danie/sus_em_uso/municipal_19/municipal_em_uso_ago_19.csv',encoding='UTF-8',sep=";")
  df21 = pd.read_csv('C:/Users/danie/sus_em_uso/municipal_19/municipal_em_uso_set_19.csv',encoding='UTF-8',sep=";")
  df22 = pd.read_csv('C:/Users/danie/sus_em_uso/municipal_19/municipal_em_uso_out_19.csv',encoding='UTF-8',sep=";")
  df23 = pd.read_csv('C:/Users/danie/sus_em_uso/municipal_19/municipal_em_uso_nov_19.csv',encoding='UTF-8',sep=";")
  df24 = pd.read_csv('C:/Users/danie/sus_em_uso/municipal_19/municipal_em_uso_dez_19.csv',encoding='UTF-8',sep=";")

  df25 = pd.read_csv('C:/Users/danie/sus_existentes/estadual_19/estadual_exist_jan_19.csv',encoding='UTF-8',sep=";")  #Dataframes da pasta (existentes: estadual 19) - jan a dez/19
  df26 = pd.read_csv('C:/Users/danie/sus_existentes/estadual_19/estadual_exist_fev_19.csv',encoding='UTF-8',sep=";")
  df27 = pd.read_csv('C:/Users/danie/sus_existentes/estadual_19/estadual_exist_mar_19.csv',encoding='UTF-8',sep=";")
  df28 = pd.read_csv('C:/Users/danie/sus_existentes/estadual_19/estadual_exist_abr_19.csv',encoding='UTF-8',sep=";")
  df29 = pd.read_csv('C:/Users/danie/sus_existentes/estadual_19/estadual_exist_mai_19.csv',encoding='UTF-8',sep=";")
  df30 = pd.read_csv('C:/Users/danie/sus_existentes/estadual_19/estadual_exist_jun_19.csv',encoding='UTF-8',sep=";")
  df31 = pd.read_csv('C:/Users/danie/sus_existentes/estadual_19/estadual_exist_jul_19.csv',encoding='UTF-8',sep=";")
  df32 = pd.read_csv('C:/Users/danie/sus_existentes/estadual_19/estadual_exist_ago_19.csv',encoding='UTF-8',sep=";")
  df33 = pd.read_csv('C:/Users/danie/sus_existentes/estadual_19/estadual_exist_set_19.csv',encoding='UTF-8',sep=";")
  df34 = pd.read_csv('C:/Users/danie/sus_existentes/estadual_19/estadual_exist_out_19.csv',encoding='UTF-8',sep=";")
  df35 = pd.read_csv('C:/Users/danie/sus_existentes/estadual_19/estadual_exist_nov_19.csv',encoding='UTF-8',sep=";")
  df36 = pd.read_csv('C:/Users/danie/sus_existentes/estadual_19/estadual_exist_dez_19.csv',encoding='UTF-8',sep=";")
  
  df37 = pd.read_csv('C:/Users/danie/sus_existentes/municipal_19/municipal_exist_jan_19.csv',encoding='UTF-8',sep=";")  #Dataframes da pasta (existentes: municipal 19) - jan a dez/19
  df38 = pd.read_csv('C:/Users/danie/sus_existentes/municipal_19/municipal_exist_fev_19.csv',encoding='UTF-8',sep=";")
  df39 = pd.read_csv('C:/Users/danie/sus_existentes/municipal_19/municipal_exist_mar_19.csv',encoding='UTF-8',sep=";")
  df40 = pd.read_csv('C:/Users/danie/sus_existentes/municipal_19/municipal_exist_abr_19.csv',encoding='UTF-8',sep=";")
  df41 = pd.read_csv('C:/Users/danie/sus_existentes/municipal_19/municipal_exist_mai_19.csv',encoding='UTF-8',sep=";")
  df42 = pd.read_csv('C:/Users/danie/sus_existentes/municipal_19/municipal_exist_jun_19.csv',encoding='UTF-8',sep=";")
  df43 = pd.read_csv('C:/Users/danie/sus_existentes/municipal_19/municipal_exist_jul_19.csv',encoding='UTF-8',sep=";")
  df44 = pd.read_csv('C:/Users/danie/sus_existentes/municipal_19/municipal_exist_ago_19.csv',encoding='UTF-8',sep=";")
  df45 = pd.read_csv('C:/Users/danie/sus_existentes/municipal_19/municipal_exist_set_19.csv',encoding='UTF-8',sep=";")
  df46 = pd.read_csv('C:/Users/danie/sus_existentes/municipal_19/municipal_exist_out_19.csv',encoding='UTF-8',sep=";")
  df47 = pd.read_csv('C:/Users/danie/sus_existentes/municipal_19/municipal_exist_nov_19.csv',encoding='UTF-8',sep=";")
  df48 = pd.read_csv('C:/Users/danie/sus_existentes/municipal_19/municipal_exist_dez_19.csv',encoding='UTF-8',sep=";") 

  meses_col = ["jan","fev","mar","abr","mai","jun","jul","ago","set","out","nov","dez"]       #lista de meses para o parâmetro "keys" da função "concat", da biblioteca Pandas
  em_uso_est_jan_dez_19 = [df1,df2,df3,df4,df5,df6,df7,df8,df9,df10,df11,df12]                #listas dos dataframes para transformação e mesclagem de arquivos
  em_uso_mun_jan_dez_19 = [df13,df14,df15,df16,df17,df18,df19,df20,df21,df22,df23,df24]
  exist_est_jan_dez_19 = [df25,df26,df27,df28,df29,df30,df31,df32,df33,df34,df35,df36]
  exist_mun_jan_dez_19 = [df37,df38,df39,df40,df41,df42,df43,df44,df45,df46,df47,df48]
  ```
  #### Temos 48 arquivos que foram gerados na plataforma TabNet, que estavam distribuídos em 04 pastas diferentes. A função "read_csv", do Pandas, foi útil para efetuar leituras dos arquivos no ambiente Python. Com finalidade de reunir os dataframes correspondentes, também foram criadas as listas que vão servir de base para transformação e geração de novos arquivos.
  
  ##### Manipulação de arquivos CSV em 04 dataframes distintos para o posterior carregamento.
  
  ```
  un1 = pd.concat(em_uso_est_jan_fev_19, keys=meses_col)                  #Concatenação das dataframes dos 12 arquivos CSV (em_uso_est_jan_dez_19)
  div1 = un1["municipio"].str.split(" ",n=1,expand=True)                  #Criação de novas colunas a partir de uma coluna ("Municipio")
  un1["cod_ibge"] = div1[0]
  un1["municipio2"] = div1[1]
  arq1 = un1.loc[:,::-1]                                                  #Reordenamento das duas colunas da direita para esquerda
  arq1.drop(columns=["total","municipio","_forno_de_bier"],inplace=True)  #Eliminação de colunas após deslocamento 
  arq1.to_csv("C:/Users/danie/OneDrive/Área de Trabalho/arquivos_projeto_data_analysis/Coleta de dados/Gestão de equipamentos SUS/em_uso_est_jan_fev_19.csv",sep=";") #gerando arquivo de saída
  
  un2 = pd.concat(em_uso_mun_jan_fev_19, keys=meses_col)                  #Concatenar os dataframes dos 12 arquivos CSV (exist_est_jan_dez_19)
  div2 = un3["municipio"].str.split(" ",n=1,expand=True)                  #Criação de novas colunas a partir de uma coluna ("Municipio")
  un2["cod_ibge"] = div2[0]
  un2["municipio2"] = div2[1]
  arq2 = un2.loc[:,::-1]                                                  #Reordenamento das duas colunas da direita para esquerda
  arq2.drop(columns=["total","municipio","_forno_de_bier"],inplace=True)  #Eliminação de colunas após deslocamento 
  arq2.to_csv("C:/Users/danie/OneDrive/Área de Trabalho/arquivos_projeto_data_analysis/Coleta de dados/Gestão de equipamentos SUS/em_uso_mun_jan_fev_19.csv",sep=";") #gerando arquivo de saída 
  
  un3 = pd.concat(exist_est_jan_fev_19, keys=meses_col)                   #Concatenar os dataframes dos 12 arquivos CSV (exist_est_jan_dez_19)
  div3 = un3["municipio"].str.split(" ",n=1,expand=True)                  #Criação de novas colunas a partir de uma coluna ("Municipio")
  un3["cod_ibge"] = div3[0]
  un3["municipio2"] = div3[1]
  arq3 = un3.loc[:,::-1]                                                  #Reordenamento das duas colunas da direita para esquerda
  arq3.drop(columns=["total","municipio","_forno_de_bier"],inplace=True)  #Eliminação de colunas após deslocamento 
  arq3.to_csv("C:/Users/danie/OneDrive/Área de Trabalho/arquivos_projeto_data_analysis/Coleta de dados/Gestão de equipamentos SUS/exist_est_jan_fev_19.csv",sep=";")  #gerando arquivo de saída

  un4 = pd.concat(exist_mun_jan_fev_19, keys=meses_col)                   #Concatenar os dataframes dos 12 arquivos CSV (exist_mun_jan_dez_19)
  div4 = un4["municipio"].str.split(" ",n=1,expand=True)                  #Criação de novas colunas a partir de uma coluna ("Municipio")
  un4["cod_ibge"] = div4[0]
  un4["municipio2"] = div4[1]
  arq4 = un4.loc[:,::-1]                                                  #Reordenamento das duas colunas da direita para esquerda
  arq4.drop(columns=["total","municipio","_forno_de_bier"],inplace=True)  #Eliminação de colunas após deslocamento 
  arq4.to_csv("C:/Users/danie/OneDrive/Área de Trabalho/arquivos_projeto_data_analysis/Coleta de dados/Gestão de equipamentos SUS/exist_mun_jan_fev_19.csv",sep=";")  #gerando arquivo de saída 
  ```
  
  2. [Arquivos gerados no ETL](#subtitulo_b)
  ##### Novos arquivos gerados no “script ETL”.
  ![image](https://user-images.githubusercontent.com/83841974/133828669-0e31ce2d-e02a-47b4-96d8-633f0b490dd3.png)
  #### Os 04 arquivos gerados no script ETL foram direcionados para uma pasta específica (Gestão de Equipamentos)
 [Voltar](#titulo)
