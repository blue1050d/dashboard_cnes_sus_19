## Origem da extração dos dados
#### O ponto inicial da extração de dados de equipamentos da rede pública (gestão municipal e estadual) foi através do DATASUS. Para ilustrar como foram efetuadas as extrações dos dados
  
  ##### Apresentação do site do DATASUS e os campos “Serviços para o Cidadão”, com destaque para o TabNet.
  ![image](https://user-images.githubusercontent.com/83841974/133708010-0feb13f9-9214-40bf-94c4-bba4e3e5be5a.png)  
  
  ##### O campo “Rede Assistencial” oferece opções para as pesquisas, e o escolhido foi “CNES – Recursos Físicos”.
  ![image](https://user-images.githubusercontent.com/83841974/133708793-520b6d07-6a6a-4fc6-bc55-1c0f1e52dbe7.png)
  
  ##### Dentro da página “Recursos Físicos”, o campo escolhido “Equipamentos” e a “Abrangência Geográfica” nos direciona para a ambiente de dados do TabNet.
  ![image](https://user-images.githubusercontent.com/83841974/133708915-5d763e35-7f40-4673-90fa-bbfe7b2d1f04.png)
  
  ##### Dentro da plataforma dos “Recursos Físicos”, temos os campos e seleções que atendem os objetivos.
  ![image](https://user-images.githubusercontent.com/83841974/133708994-34891681-2f9b-456e-8cfb-bc6c41945f98.png)
  
  ##### Seleção das gestões e dos equipamentos diversos.
  ![image](https://user-images.githubusercontent.com/83841974/133709061-a89bf89d-4ae9-4c1a-b61c-253b589538f3.png)
  
  ##### Resultado da pesquisa
  ![image](https://user-images.githubusercontent.com/83841974/133709170-f7e25b26-9dd6-424d-8509-e07631e5d9bb.png)
  
  ##### No campo abaixo, o botão “Copia como .CSV” permite baixar a tabela neste formato.
  ![image](https://user-images.githubusercontent.com/83841974/133709195-b48cfb01-d2f0-414d-9fd4-cb1704ebc579.png)
  
  ##### Exemplo das pastas criadas para cada status.
  ![image](https://user-images.githubusercontent.com/83841974/133709228-cc5d5b90-15aa-4363-988a-41bddeef517a.png)
  
  ##### Pastas de ambas as gestões, das quais, tem os meses/status referentes ao ano de 2019.
  ![image](https://user-images.githubusercontent.com/83841974/133709264-b80a58b8-029c-44fe-b445-251c0c6876d8.png)
  
  ##### Arquivos contendo os dados para cada mês, e vão servir para compor um novo arquivo.
  ![image](https://user-images.githubusercontent.com/83841974/133709314-ab2591ea-7a2a-4bc1-9ea9-e94adba07cd2.png)
  
  
  #### Devido ao número considerável de linhas - nas quais estão representados os municípios + DF, e diversas colunas que estão vinculados aos equipamentos, as alterações de meses (jan a dez), status (existente/em uso) e gestões (municipal/estadual) para gerar os arquivos .CSV foram efetuadas repetitivamente, nos passos das imagens 4 a 7.
