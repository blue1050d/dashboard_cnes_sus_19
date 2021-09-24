## Definção de DSN no ODBC para conexão no Power Query
#### Antes de criar conexão direta no Power Query, deve-se definir a DSN de usuário e sistema no ODBC para a extensão do SQLite 3, a fim de acessar o banco de dados.
<a name="subtitulo_d"></a>

  Criação de uma nova DSN de usuário para identificar a fonte da conexão
  ![image](https://user-images.githubusercontent.com/83841974/134348746-f1ba156b-81ee-4680-9d6c-44cd82b50bf9.png)
  
  O driver “SQLite3 ODBC Driver” é o compatível para esta definição.
  ![image](https://user-images.githubusercontent.com/83841974/134349543-086ac7a1-dbb8-426d-9bf3-c6dfc8759f50.png)
  
  Configuração do DSN de usuário. O nome do banco de dados é o mesmo do que foi criado no SQLite Studio.
  ![image](https://user-images.githubusercontent.com/83841974/134349633-461d4c52-a814-4132-846e-b8b623e1cbb6.png)
  
  O arquivo DBF refere-se à origem da exportação a partir do SQLite Studio.
  ![image](https://user-images.githubusercontent.com/83841974/134349728-aeb9af2f-0b03-4379-bf7c-2c2e372a841f.png)
  
  Fonte de dados criado para efetuar obtenção de dados no Power Query.
  ![image](https://user-images.githubusercontent.com/83841974/134349803-83f5204c-8d9c-40ca-bd0d-628ebe648944.png)
  
  OBS: os passos para criar DSN de sistema é o mesmo do usuário.
