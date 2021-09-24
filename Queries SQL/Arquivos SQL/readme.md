## Criação de tabelas no SQLite Studio
#### Para efeitos de adaptação no ambiente SQL, os dados pré-processados necessitam ser carregados num ambiente SGDB para iniciar as queries das requisições. Com o intuito de criar tabelas de forma intuitiva, foi utilizado o SQLite Studio, que sucede ao SQLite em termos de recursos. 
##### Logomarca do SQLite Studio
![image](https://user-images.githubusercontent.com/83841974/133829836-46d3d7eb-9d57-4a3f-884d-67355d997ab5.png)
<a name="subtitulo_c"></a>

  ##### Ambiente do SQLite Studio 
  ![image](https://user-images.githubusercontent.com/83841974/133888258-eed09ec8-7499-4f71-976b-a31f6f593f8a.png)
  
  ##### Exemplo de um comando para criar tabelas, e replicadas para outras três que têm similaridades estruturais. Note que os nomes das colunas foram extraídos de um dos arquivos CSV para alinhá-las no processo de importação de dados.
  ```
  CREATE TABLE tbEqEmUsoMunJanDez19 (
    mes                                               TEXT (3)   REFERENCES tbMes (mes),
    indice                                            INT (6),
    municipio2                                        TEXT (100) REFERENCES tbMunicipios (municipio),
    cod_ibge                                          INT (6)    REFERENCES tbMunicipios (cod_ibge),
    _equipamento_para_hemodialise                     INT (4),
    _equipamento_de_circulacao_extracorporea          INT (4),
    _equipamentos_de_aferese                          INT (4),
    _bomba_de_infusao_de_hemoderivados                INT (4),
    _aparelho_de_eletroestimulacao                    INT (4),
    _aparelho_de_diatermia_por_ultrassom_ondas_curtas INT (4),
    _respirador_ventilador                            INT (4),
    _reanimador_pulmonar_ambu                         INT (4),
    _monitor_de_pressao_nao_invasivo                  INT (4),
    _monitor_de_pressao_invasivo                      INT (4),
    _monitor_de_ecg                                   INT (4),
    _marcapasso_temporario                            INT (4),
    _incubadora                                       INT (4),
    _equipamento_de_fototerapia                       INT (4),
    _desfibrilador                                    INT (4),
    _debitometro                                      INT (4),
    _bilirrubinometro                                 INT (4),
    _berço_aquecido                                   INT (4),
    _bomba_de_infusao                                 INT (4),
    _bomba_balao_intra_aortico                        INT (4),
    _eletroencefalografo                              INT (4),
    _eletrocardiografo                                INT (4),
    _campimetro                                       INT (4),
    _biomicroscopio_lampada_de_fenda                  INT (4),
    _tonometro_de_aplanacao                           INT (4),
    _ceratometro                                      INT (4),
    _oftalmoscopio                                    INT (4),
    _retinoscopio                                     INT (4),
    _projetor_ou_tabela_de_optotipos                  INT (4),
    _lensometro                                       INT (4),
    _refrator                                         INT (4),
    _coluna_oftalmologica                             INT (4),
    _cadeira_oftalmologica                            INT (4),
    _microscopio_cirurgico                            INT (4),
    _laparoscopio_video                               INT (4),
    _equipamentos_para_optometria                     INT (4),
    _endoscopio_digestivo                             INT (4),
    _endoscopio_das_vias_urinarias                    INT (4),
    _endoscopio_das_vias_respiratorias                INT (4),
    _pet_ct                                           INT (4),
    _mamografo_computadorizado                        INT (4),
    _processadora_de_filme_exclusiva_para_mamografia  INT (4),
    _ultrassom_convencional                           INT (4),
    _ultrassom_ecografo                               INT (4),
    _ultrassom_doppler_colorido                       INT (4),
    _ressonancia_magnetica                            INT (4),
    _tomógrafo_computadorizado                        INT (4),
    _raio_x_para_hemodinamica                         INT (4),
    _raio_x_para_densitometria_ossea                  INT (4),
    _raio_x_com_fluoroscopia                          INT (4),
    _raio_x_dentario                                  INT (4),
    _raio_x_mais_de_500ma                             INT (4),
    _raio_x_de_100_a_500_ma                           INT (4),
    _raio_x_ate_100_ma                                INT (4),
    _mamografo_com_estereotaxia                       INT (4),
    _mamografo_com_comando_simples                    INT (4),
    _gama_camara                                      INT (4) 
);
  ```
  ##### Estrutura  tabular da tabela "tbEqExistMunJanDez19", que inclui as FK’s (Foreign Keys) dos dados que são dimensionais (mês e municípios). Sabendo que os dados fornecidos pelos arquivos CSV não são bem estruturados (por conter inúmeras colunas, o que tornam as consultas complexas).
  ![image](https://user-images.githubusercontent.com/83841974/133831933-ec46b551-9c7b-4d8c-a2e5-bbf41b595e48.png)
  
  ##### Exemplo de definição de uma Chave Primária do campo "mês", da tabela "tbEqExistMunJanDez19".
  ![Captura de Tela (574)](https://user-images.githubusercontent.com/83841974/133832437-4346936f-7caa-4794-872d-0624238ef067.png)
  
  ##### Exemplo de uma importação do arquivo .csv para a tabela criada.
  
  Clique no ícone ![image](https://user-images.githubusercontent.com/83841974/133888952-c30c11c3-f0f9-4961-b46e-c9e3ef05a58c.png) "import data to table" e aparecerá a tela para selecionar a tabela desejada
  ![image](https://user-images.githubusercontent.com/83841974/133888600-0d67fd11-5f45-4001-96a0-849be02526e1.png)
  
  Selecione o tipo de fonte de dados (CSV) e no campo "Options", clique na pasta para selecionar o arquivo relacionado.
  ![image](https://user-images.githubusercontent.com/83841974/133888632-56a04f20-46dd-461d-b744-18b1552401f2.png)
  
  Selecione o arquivo "exist_mun_jan_dez_19"
  ![image](https://user-images.githubusercontent.com/83841974/133888655-8d72bc8e-843c-4da1-b73c-02238996fe0a.png)
  
  O "text encoding" é UTF-8, assim como selecionar a opção "Ignore errors". No campo "Data source options", clique em "First line represents CSV column names" e o separador de campo é ponto e virgula (semicolon). Clique em "Finish" para inicializar o processo de importação.
  ![image](https://user-images.githubusercontent.com/83841974/133888721-11f6c71a-796c-4c05-9e55-a5e374af929f.png)
  
  Aba "Data" com os dados importado do arquivo "exist_mun_jan_dez_19.csv". Percebe que a estrutura colunar é imensa, totalizando 60 (sendo que as 56 estão relacionados aos equipamentos)
  ![image](https://user-images.githubusercontent.com/83841974/133888762-da038f39-8a21-4b35-b6cc-ed65e5867fae.png)
  
  ##### Como foi explicado na imagem 2.5 (do capitulo 2), os dados não são normalizados. Para reduzir a dimensão tabular, foi necessário criar uma subquery que atenda aos requisitos, o que torna as queries mais fáceis de serem elaboradas.
![image](https://user-images.githubusercontent.com/83841974/133837406-0b001edd-27fd-4931-8179-25b4314315b8.png)

  ##### Exemplo de uma subquery para redução de colunas que possa atender os requisitos dos questionamentos. A criação de uma nova coluna “tipo_equipamento” tem como o objetivo unificar as 56 colunas dentro de uma única coluna, e atribuí-las a cada município e meses correspondentes, conforme as imagens a seguir após o código.
  
  ```
  select 
    cod_ibge,
    municipio2 as municipio,
    tipo_equipamento,
    mes,   
    qtde,
    case
        when (lead(qtde) over(partition by cod_ibge) is null or lead(qtde) over(partition by cod_ibge) between -7000 and 7000) and mes = "dez" 
        then "-"
        else cast(lead(qtde) over(partition by cod_ibge) as integer)
    end as mes_post,
    case
        when ((lead(qtde) over(partition by cod_ibge) - qtde) is null or (lead(qtde) over(partition by cod_ibge) - qtde) between -7000 and 7000) and mes = "dez"
        then "-"
        else cast((lead(qtde) over(partition by cod_ibge) - qtde) as integer)
    end as saldo,
    case
        when (round((cast(lead(qtde) over(partition by cod_ibge) as integer) - cast(qtde as integer)) / cast(qtde as integer),3) is null or 
        (lead(qtde) over(partition by cod_ibge) - qtde) between -7000 and 7000) and mes = "dez" 
        then "-"
        when (round((cast(lead(qtde) over(partition by cod_ibge) as float) - cast(qtde as float)) / cast(qtde as float),3) = 0 or 
        (lead(qtde) over(partition by cod_ibge) - qtde) = 0) and mes = "dez" and qtde between 0 and 7000
        then cast("0" as integer)
        else coalesce(round((cast(lead(qtde) over(partition by cod_ibge) as float) - cast(qtde as float)) / cast(qtde as float),3),0)
    end as variacao     
from
(
select mes,cod_ibge,municipio2, 'rx_comum'  as tipo_equipamento, cast(replace((_raio_x_ate_100_ma + _raio_x_de_100_a_500_ma + _raio_x_mais_de_500ma),"-","0") as integer) as qtde
from tbEqEmUsoEstJanDez19
union all
select mes,cod_ibge,municipio2, 'rx_hemod'  as tipo_equipamento, cast(replace(_raio_x_para_hemodinamica,"-","0") as integer) as qtde
from tbEqEmUsoEstJanDez19
union all
select mes,cod_ibge,municipio2,'rx_fluor'  as tipo_equipamento, cast(replace(_raio_x_com_fluoroscopia,"-","0") as integer) as qtde
from tbEqEmUsoEstJanDez19
union all
select mes,cod_ibge,municipio2,'rx_dens'  as tipo_equipamento, cast(replace(_raio_x_para_densitometria_ossea,"-","0") as integer) as qtde
from tbEqEmUsoEstJanDez19
union all
select mes,cod_ibge,municipio2,'rx_odonto'  as tipo_equipamento, cast(replace(_raio_x_dentario,"-","0") as integer) as qtde
from tbEqEmUsoEstJanDez19
union all
select mes,cod_ibge,municipio2,'tomografo'  as tipo_equipamento, cast(replace(_tomógrafo_computadorizado,"-","0") as integer) as qtde
from tbEqEmUsoEstJanDez19
union all
select mes,cod_ibge,municipio2,'mamografo'  as tipo_equipamento, cast(replace((_mamografo_computadorizado + _mamografo_com_comando_simples + _mamografo_com_estereotaxia),"-","0") as integer) as qtde
from tbEqEmUsoEstJanDez19
union all
select mes,cod_ibge,municipio2,'ressonancia_magnetica'  as tipo_equipamento,cast(replace(_ressonancia_magnetica,"-","0") as integer) as qtde
from tbEqEmUsoEstJanDez19
union all
select mes,cod_ibge,municipio2,'usg'  as tipo_equipamento, cast(replace((_ultrassom_convencional + _ultrassom_ecografo + _ultrassom_doppler_colorido),"-","0") as integer) as qtde
from tbEqEmUsoEstJanDez19
union all
select mes,cod_ibge,municipio2,'pet_ct'  as tipo_equipamento, cast(replace(_pet_ct,"-","0") as integer) as qtde
from tbEqEmUsoEstJanDez19
union all
select mes,cod_ibge,municipio2,'gama_camara'  as tipo_equipamento, cast(replace(_gama_camara,"-","0") as integer) as qtde
from tbEqEmUsoEstJanDez19
union all
select mes,cod_ibge,municipio2,'processadora_de_filme_exclusiva_para_mamografia'  as tipo_equipamento, cast(replace(_processadora_de_filme_exclusiva_para_mamografia,"-","0") as integer) as qtde
from tbEqEmUsoEstJanDez19
)
order by cod_ibge
  ```
##### Após a redução e agrupamento por municípios e meses, este é o resultado. Da 5ª até a 8ª coluna são os resultados das análises.
![image](https://user-images.githubusercontent.com/83841974/133837431-c2179e56-a725-4201-882b-84f58ed23ed6.png)

Essas etapas são replicáveis nas demais, somente alterando o nome da tabela. As queries dos requisitos estão inseridas na 7ª e 8ª linha.

##### Query para números relativos e absolutos da gestão estadual (2019)
```
select
    eee19.cod_ibge as cod_ibge,
    eee19.municipio as municipio,
    eee19.tipo_equipamento as tipo_equipamento,
    eee19.qtde as qtde,
    round((cast(eee19.qtde as real) / cast(mun19.pop as real)) * 100000,2) as equip_por_cem_mil_hab
from tbViewSaldoVariacaoEquipExistEst19 as eee19
inner join tbMunicipios as mun19
on eee19.cod_ibge = mun19.cod_ibge
where mes = "dez"
```

##### Amostra no ambiente SQLiteStudio
![image](https://user-images.githubusercontent.com/83841974/133841708-18e48625-4976-4395-8da2-cc6144d063fd.png)

##### Exemplo da quantidade de aparelho USG (absoluto) e taxa de equipamentos por 100 mil habitantes (relativo) da cidade de São Paulo e Distrito Federal.
![image](https://user-images.githubusercontent.com/83841974/133841799-a731cc7b-d237-4e63-b26c-c033febc96d9.png)

#### Para criar dinamismo na consulta, e não necessariamente novas tabelas - o que inviabilizaria a performance na extração de fonte de dados do Power Query, foram criadas as tabelas virtuais (Views) das tabelas normalizadas na etapa anterior.

Clique no ícone ![image](https://user-images.githubusercontent.com/83841974/133891059-6fa102f8-b21b-46ab-b652-1041a78fb9bb.png) "Create a view" e aparecerá esta tela
![image](https://user-images.githubusercontent.com/83841974/133891026-4eb16297-f95f-4476-98b6-dab831f42462.png)

Copie e cole o código da primeira consulta efetuada na aba "Query", e depois, vai no ícone "Commit the view changes". Aparecerá outra tela a query a ser executada, e clique em OK.
![image](https://user-images.githubusercontent.com/83841974/133891237-7ffe6fc5-7e89-4259-82c0-ed2d3e772eee.png)

No campo "Database", acesse o "View" e clique na tabela virtual gerada ("teste" como exemplo).
![image](https://user-images.githubusercontent.com/83841974/133891396-7b6dac38-9a56-4bbd-a1ea-370dbffeec6b.png)
