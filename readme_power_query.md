  # Preparação dos dados no Power Query
  Após a extração dos dados, começamos a parte da preparação dos dados para que possamos classificar e transformar os dados. 
  ## Views dos saldos e variações
  
  Dados brutos da tabela "tbViewSaldoVariacaoEquipEmUsoEst19" e suas qualidades exibidas abaixo dos cabeçalhos da coluna.
  ![image](https://user-images.githubusercontent.com/83841974/134354643-d7760953-e0b6-420e-a4ec-64d1ef55a4d0.png)
  
  Etapas aplicadas na preparação de dados. Os detalhes serão enumerados na tabela a seguir.
  ![image](https://user-images.githubusercontent.com/83841974/134359941-0c5dcdaa-7efa-4e85-984b-b918ce7aa28e.png)

  Metadados das etapas:
  
| Etapa                             | Informação                                                                                                                                                                 |
|-----------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Fonte                             | dbEquipSUS19                                                                                                                                                               |
| Navegação                         | ODCB(dsn=dbEquipSUS19) -> tbViewSaldoVariacaoEquiEmUsoEst19                                                                                                                                          |
| Tipo Alterado                     | Colunas alteradas: <br><br> - cod_ibge: dec para int<br> - qtde: texto para int<br> - mes_post: texto para int <br> - saldo: texto para int<br> - variacao: texto para int |
| Colocar cada palavra em maiúscula | Alteração da letra minúscula para maiúscula na coluna "mes"                                                                                                                |
| Colunas removidas                 | Coluna "variacao" removido                                                                                                                                                 |
| Personalização Adicionada         | Redefinição do cálculo de variação na coluna "Personalizar"<br><br>variação = saldo/quantidade                                                                             |
| Colunas renomeadas                | Coluna "Personalizar" foi renomeado para "variacao"                                                                                                                        |
| Tipo Alterado 1                   | Alteração de tipo de dados da "variacao" de alfanumérico para percentual                                                                                                   |
| Erros substituídos                | Substituição dos erros da coluna "variacao" para o valor "0"         

Estes dados são válidos para as seguintes tabelas: 

- tbViewSaldoVariacaoEquipEmUsoEst19;
- tbViewSaldoVariacaoEquipEmUsoMun19;
- tbViewSaldoVariacaoEquipExistEst19;
- tbViewSaldoVariacaoEquipExistMun19

## Views dos números relativos e absolutos

Dados brutos da tabela "tbViewTaxaEqEst19" e suas qualidades exibidas abaixo dos cabeçalhos da coluna.
![image](https://user-images.githubusercontent.com/83841974/134394289-2395b205-7b3c-45ca-99f3-7dcc59966c56.png)

Etapas aplicadas na preparação de dados. Os detalhes serão enumerados na tabela a seguir.

![image](https://user-images.githubusercontent.com/83841974/134394668-e87e1d92-d9c6-4f7c-ae93-438925573eab.png)

Metadados das etapas:

| Etapa         | Informação                                                                                                               |
|---------------|--------------------------------------------------------------------------------------------------------------------------|
| Fonte         | dbEquipSUS19                                                                                                             |
| Navegação     | ODCB(dsn=dbEquipSUS19) -> tbViewTaxaEqEst19                                                                              |
| Tipo Alterado | Colunas alteradas: <br><br>- cod_ibge: dec para int<br>- qtde: texto para int<br>- equip_por_cem_mil_hab: texto para dec |

Estes dados são válidos para as seguintes tabelas: 

- tbViewTaxaEqEst19;
- tbViewTaxaEqMun19

Outras tabelas

As outras tabelas comuns complementam o conjunto para relacionar dados. 
