--
-- File generated with SQLiteStudio v3.3.3 on qua set 8 16:07:21 2021
--
-- Text encoding used: UTF-8
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- View: tbViewSaldoVariacaoEquipEmUsoEst19
CREATE VIEW tbViewSaldoVariacaoEquipEmUsoEst19 AS
    SELECT cod_ibge,
           municipio2 AS municipio,
           tipo_equipamento,
           mes,
           qtde,
           CASE WHEN (lead(qtde) OVER (PARTITION BY cod_ibge) IS NULL OR 
                      lead(qtde) OVER (PARTITION BY cod_ibge) BETWEEN -7000 AND 7000) AND 
                     mes = "dez" THEN "-" ELSE CAST (lead(qtde) OVER (PARTITION BY cod_ibge) AS INTEGER) END AS mes_post,
           CASE WHEN ( (lead(qtde) OVER (PARTITION BY cod_ibge) - qtde) IS NULL OR 
                       (lead(qtde) OVER (PARTITION BY cod_ibge) - qtde) BETWEEN -7000 AND 7000) AND 
                     mes = "dez" THEN "-" ELSE CAST ( (lead(qtde) OVER (PARTITION BY cod_ibge) - qtde) AS INTEGER) END AS saldo,
           CASE WHEN (round( (CAST (lead(qtde) OVER (PARTITION BY cod_ibge) AS INTEGER) - CAST (qtde AS INTEGER) ) / CAST (qtde AS INTEGER), 3) IS NULL OR 
                      (lead(qtde) OVER (PARTITION BY cod_ibge) - qtde) BETWEEN -7000 AND 7000) AND 
                     mes = "dez" THEN "-" WHEN (round( (CAST (lead(qtde) OVER (PARTITION BY cod_ibge) AS FLOAT) - CAST (qtde AS FLOAT) ) / CAST (qtde AS FLOAT), 3) = 0 OR 
                                                (lead(qtde) OVER (PARTITION BY cod_ibge) - qtde) = 0) AND 
                                               mes = "dez" AND 
                                               qtde BETWEEN 0 AND 7000 THEN CAST ("0" AS INTEGER) ELSE coalesce(round( (CAST (lead(qtde) OVER (PARTITION BY cod_ibge) AS FLOAT) - CAST (qtde AS FLOAT) ) / CAST (qtde AS FLOAT), 3), 0) END AS variacao
      FROM (
               SELECT mes,
                      cod_ibge,
                      municipio2,
                      'rx_comum' AS tipo_equipamento,
                      CAST ([replace]( (_raio_x_ate_100_ma + _raio_x_de_100_a_500_ma + _raio_x_mais_de_500ma), "-", "0") AS INTEGER) AS qtde
                 FROM tbEqEmUsoEstJanDez19
               UNION ALL
               SELECT mes,
                      cod_ibge,
                      municipio2,
                      'rx_hemod' AS tipo_equipamento,
                      CAST ([replace](_raio_x_para_hemodinamica, "-", "0") AS INTEGER) AS qtde
                 FROM tbEqEmUsoEstJanDez19
               UNION ALL
               SELECT mes,
                      cod_ibge,
                      municipio2,
                      'rx_fluor' AS tipo_equipamento,
                      CAST ([replace](_raio_x_com_fluoroscopia, "-", "0") AS INTEGER) AS qtde
                 FROM tbEqEmUsoEstJanDez19
               UNION ALL
               SELECT mes,
                      cod_ibge,
                      municipio2,
                      'rx_dens' AS tipo_equipamento,
                      CAST ([replace](_raio_x_para_densitometria_ossea, "-", "0") AS INTEGER) AS qtde
                 FROM tbEqEmUsoEstJanDez19
               UNION ALL
               SELECT mes,
                      cod_ibge,
                      municipio2,
                      'rx_odonto' AS tipo_equipamento,
                      CAST ([replace](_raio_x_dentario, "-", "0") AS INTEGER) AS qtde
                 FROM tbEqEmUsoEstJanDez19
               UNION ALL
               SELECT mes,
                      cod_ibge,
                      municipio2,
                      'tomografo' AS tipo_equipamento,
                      CAST ([replace](_tomógrafo_computadorizado, "-", "0") AS INTEGER) AS qtde
                 FROM tbEqEmUsoEstJanDez19
               UNION ALL
               SELECT mes,
                      cod_ibge,
                      municipio2,
                      'mamografo' AS tipo_equipamento,
                      CAST ([replace]( (_mamografo_computadorizado + _mamografo_com_comando_simples + _mamografo_com_estereotaxia), "-", "0") AS INTEGER) AS qtde
                 FROM tbEqEmUsoEstJanDez19
               UNION ALL
               SELECT mes,
                      cod_ibge,
                      municipio2,
                      'ressonancia_magnetica' AS tipo_equipamento,
                      CAST ([replace](_ressonancia_magnetica, "-", "0") AS INTEGER) AS qtde
                 FROM tbEqEmUsoEstJanDez19
               UNION ALL
               SELECT mes,
                      cod_ibge,
                      municipio2,
                      'usg' AS tipo_equipamento,
                      CAST ([replace]( (_ultrassom_convencional + _ultrassom_ecografo + _ultrassom_doppler_colorido), "-", "0") AS INTEGER) AS qtde
                 FROM tbEqEmUsoEstJanDez19
               UNION ALL
               SELECT mes,
                      cod_ibge,
                      municipio2,
                      'pet_ct' AS tipo_equipamento,
                      CAST ([replace](_pet_ct, "-", "0") AS INTEGER) AS qtde
                 FROM tbEqEmUsoEstJanDez19
               UNION ALL
               SELECT mes,
                      cod_ibge,
                      municipio2,
                      'gama_camara' AS tipo_equipamento,
                      CAST ([replace](_gama_camara, "-", "0") AS INTEGER) AS qtde
                 FROM tbEqEmUsoEstJanDez19
               UNION ALL
               SELECT mes,
                      cod_ibge,
                      municipio2,
                      'processadora_de_filme_exclusiva_para_mamografia' AS tipo_equipamento,
                      CAST ([replace](_processadora_de_filme_exclusiva_para_mamografia, "-", "0") AS INTEGER) AS qtde
                 FROM tbEqEmUsoEstJanDez19
           )
     ORDER BY cod_ibge;


-- View: tbViewSaldoVariacaoEquipEmUsoMun19
CREATE VIEW tbViewSaldoVariacaoEquipEmUsoMun19 AS
    SELECT cod_ibge,
           municipio2 AS municipio,
           tipo_equipamento,
           mes,
           qtde,
           CASE WHEN (lead(qtde) OVER (PARTITION BY cod_ibge) IS NULL OR 
                      lead(qtde) OVER (PARTITION BY cod_ibge) BETWEEN -7000 AND 7000) AND 
                     mes = "dez" THEN "-" ELSE CAST (lead(qtde) OVER (PARTITION BY cod_ibge) AS INTEGER) END AS mes_post,
           CASE WHEN ( (lead(qtde) OVER (PARTITION BY cod_ibge) - qtde) IS NULL OR 
                       (lead(qtde) OVER (PARTITION BY cod_ibge) - qtde) BETWEEN -7000 AND 7000) AND 
                     mes = "dez" THEN "-" ELSE CAST ( (lead(qtde) OVER (PARTITION BY cod_ibge) - qtde) AS INTEGER) END AS saldo,
           CASE WHEN (round( (CAST (lead(qtde) OVER (PARTITION BY cod_ibge) AS INTEGER) - CAST (qtde AS INTEGER) ) / CAST (qtde AS INTEGER), 3) IS NULL OR 
                      (lead(qtde) OVER (PARTITION BY cod_ibge) - qtde) BETWEEN -7000 AND 7000) AND 
                     mes = "dez" THEN "-" WHEN (round( (CAST (lead(qtde) OVER (PARTITION BY cod_ibge) AS FLOAT) - CAST (qtde AS FLOAT) ) / CAST (qtde AS FLOAT), 3) = 0 OR 
                                                (lead(qtde) OVER (PARTITION BY cod_ibge) - qtde) = 0) AND 
                                               mes = "dez" AND 
                                               qtde BETWEEN 0 AND 7000 THEN CAST ("0" AS INTEGER) ELSE coalesce(round( (CAST (lead(qtde) OVER (PARTITION BY cod_ibge) AS FLOAT) - CAST (qtde AS FLOAT) ) / CAST (qtde AS FLOAT), 3), 0) END AS variacao
      FROM (
               SELECT mes,
                      cod_ibge,
                      municipio2,
                      'rx_comum' AS tipo_equipamento,
                      CAST ([replace]( (_raio_x_ate_100_ma + _raio_x_de_100_a_500_ma + _raio_x_mais_de_500ma), "-", "0") AS INTEGER) AS qtde
                 FROM tbEqEmUsoMunJanDez19
               UNION ALL
               SELECT mes,
                      cod_ibge,
                      municipio2,
                      'rx_hemod' AS tipo_equipamento,
                      CAST ([replace](_raio_x_para_hemodinamica, "-", "0") AS INTEGER) AS qtde
                 FROM tbEqEmUsoMunJanDez19
               UNION ALL
               SELECT mes,
                      cod_ibge,
                      municipio2,
                      'rx_fluor' AS tipo_equipamento,
                      CAST ([replace](_raio_x_com_fluoroscopia, "-", "0") AS INTEGER) AS qtde
                 FROM tbEqEmUsoMunJanDez19
               UNION ALL
               SELECT mes,
                      cod_ibge,
                      municipio2,
                      'rx_dens' AS tipo_equipamento,
                      CAST ([replace](_raio_x_para_densitometria_ossea, "-", "0") AS INTEGER) AS qtde
                 FROM tbEqEmUsoMunJanDez19
               UNION ALL
               SELECT mes,
                      cod_ibge,
                      municipio2,
                      'rx_odonto' AS tipo_equipamento,
                      CAST ([replace](_raio_x_dentario, "-", "0") AS INTEGER) AS qtde
                 FROM tbEqEmUsoMunJanDez19
               UNION ALL
               SELECT mes,
                      cod_ibge,
                      municipio2,
                      'tomografo' AS tipo_equipamento,
                      CAST ([replace](_tomógrafo_computadorizado, "-", "0") AS INTEGER) AS qtde
                 FROM tbEqEmUsoMunJanDez19
               UNION ALL
               SELECT mes,
                      cod_ibge,
                      municipio2,
                      'mamografo' AS tipo_equipamento,
                      CAST ([replace]( (_mamografo_computadorizado + _mamografo_com_comando_simples + _mamografo_com_estereotaxia), "-", "0") AS INTEGER) AS qtde
                 FROM tbEqEmUsoMunJanDez19
               UNION ALL
               SELECT mes,
                      cod_ibge,
                      municipio2,
                      'ressonancia_magnetica' AS tipo_equipamento,
                      CAST ([replace](_ressonancia_magnetica, "-", "0") AS INTEGER) AS qtde
                 FROM tbEqEmUsoMunJanDez19
               UNION ALL
               SELECT mes,
                      cod_ibge,
                      municipio2,
                      'usg' AS tipo_equipamento,
                      CAST ([replace]( (_ultrassom_convencional + _ultrassom_ecografo + _ultrassom_doppler_colorido), "-", "0") AS INTEGER) AS qtde
                 FROM tbEqEmUsoMunJanDez19
               UNION ALL
               SELECT mes,
                      cod_ibge,
                      municipio2,
                      'pet_ct' AS tipo_equipamento,
                      CAST ([replace](_pet_ct, "-", "0") AS INTEGER) AS qtde
                 FROM tbEqEmUsoMunJanDez19
               UNION ALL
               SELECT mes,
                      cod_ibge,
                      municipio2,
                      'gama_camara' AS tipo_equipamento,
                      CAST ([replace](_gama_camara, "-", "0") AS INTEGER) AS qtde
                 FROM tbEqEmUsoMunJanDez19
               UNION ALL
               SELECT mes,
                      cod_ibge,
                      municipio2,
                      'processadora_de_filme_exclusiva_para_mamografia' AS tipo_equipamento,
                      CAST ([replace](_processadora_de_filme_exclusiva_para_mamografia, "-", "0") AS INTEGER) AS qtde
                 FROM tbEqEmUsoMunJanDez19
           )
     WHERE cod_ibge IS NOT 530010
     ORDER BY cod_ibge;


-- View: tbViewSaldoVariacaoEquipExistEst19
CREATE VIEW tbViewSaldoVariacaoEquipExistEst19 AS
    SELECT cod_ibge,
           municipio2 AS municipio,
           tipo_equipamento,
           mes,
           qtde,
           CASE WHEN (lead(qtde) OVER (PARTITION BY cod_ibge) IS NULL OR 
                      lead(qtde) OVER (PARTITION BY cod_ibge) BETWEEN -7000 AND 7000) AND 
                     mes = "dez" THEN "-" ELSE CAST (lead(qtde) OVER (PARTITION BY cod_ibge) AS INTEGER) END AS mes_post,
           CASE WHEN ( (lead(qtde) OVER (PARTITION BY cod_ibge) - qtde) IS NULL OR 
                       (lead(qtde) OVER (PARTITION BY cod_ibge) - qtde) BETWEEN -7000 AND 7000) AND 
                     mes = "dez" THEN "-" ELSE CAST ( (lead(qtde) OVER (PARTITION BY cod_ibge) - qtde) AS INTEGER) END AS saldo,
           CASE WHEN (round( (CAST (lead(qtde) OVER (PARTITION BY cod_ibge) AS INTEGER) - CAST (qtde AS INTEGER) ) / CAST (qtde AS INTEGER), 3) IS NULL OR 
                      (lead(qtde) OVER (PARTITION BY cod_ibge) - qtde) BETWEEN -7000 AND 7000) AND 
                     mes = "dez" THEN "-" WHEN (round( (CAST (lead(qtde) OVER (PARTITION BY cod_ibge) AS FLOAT) - CAST (qtde AS FLOAT) ) / CAST (qtde AS FLOAT), 3) = 0 OR 
                                                (lead(qtde) OVER (PARTITION BY cod_ibge) - qtde) = 0) AND 
                                               mes = "dez" AND 
                                               qtde BETWEEN 0 AND 7000 THEN CAST ("0" AS INTEGER) ELSE coalesce(round( (CAST (lead(qtde) OVER (PARTITION BY cod_ibge) AS FLOAT) - CAST (qtde AS FLOAT) ) / CAST (qtde AS FLOAT), 3), 0) END AS variacao
      FROM (
               SELECT mes,
                      cod_ibge,
                      municipio2,
                      'rx_comum' AS tipo_equipamento,
                      CAST ([replace]( (_raio_x_ate_100_ma + _raio_x_de_100_a_500_ma + _raio_x_mais_de_500ma), "-", "0") AS INTEGER) AS qtde
                 FROM tbEqExistEstJanDez19
               UNION ALL
               SELECT mes,
                      cod_ibge,
                      municipio2,
                      'rx_hemod' AS tipo_equipamento,
                      CAST ([replace](_raio_x_para_hemodinamica, "-", "0") AS INTEGER) AS qtde
                 FROM tbEqExistEstJanDez19
               UNION ALL
               SELECT mes,
                      cod_ibge,
                      municipio2,
                      'rx_fluor' AS tipo_equipamento,
                      CAST ([replace](_raio_x_com_fluoroscopia, "-", "0") AS INTEGER) AS qtde
                 FROM tbEqExistEstJanDez19
               UNION ALL
               SELECT mes,
                      cod_ibge,
                      municipio2,
                      'rx_dens' AS tipo_equipamento,
                      CAST ([replace](_raio_x_para_densitometria_ossea, "-", "0") AS INTEGER) AS qtde
                 FROM tbEqExistEstJanDez19
               UNION ALL
               SELECT mes,
                      cod_ibge,
                      municipio2,
                      'rx_odonto' AS tipo_equipamento,
                      CAST ([replace](_raio_x_dentario, "-", "0") AS INTEGER) AS qtde
                 FROM tbEqExistEstJanDez19
               UNION ALL
               SELECT mes,
                      cod_ibge,
                      municipio2,
                      'tomografo' AS tipo_equipamento,
                      CAST ([replace](_tomógrafo_computadorizado, "-", "0") AS INTEGER) AS qtde
                 FROM tbEqExistEstJanDez19
               UNION ALL
               SELECT mes,
                      cod_ibge,
                      municipio2,
                      'mamografo' AS tipo_equipamento,
                      CAST ([replace]( (_mamografo_computadorizado + _mamografo_com_comando_simples + _mamografo_com_estereotaxia), "-", "0") AS INTEGER) AS qtde
                 FROM tbEqExistEstJanDez19
               UNION ALL
               SELECT mes,
                      cod_ibge,
                      municipio2,
                      'ressonancia_magnetica' AS tipo_equipamento,
                      CAST ([replace](_ressonancia_magnetica, "-", "0") AS INTEGER) AS qtde
                 FROM tbEqExistEstJanDez19
               UNION ALL
               SELECT mes,
                      cod_ibge,
                      municipio2,
                      'usg' AS tipo_equipamento,
                      CAST ([replace]( (_ultrassom_convencional + _ultrassom_ecografo + _ultrassom_doppler_colorido), "-", "0") AS INTEGER) AS qtde
                 FROM tbEqExistEstJanDez19
               UNION ALL
               SELECT mes,
                      cod_ibge,
                      municipio2,
                      'pet_ct' AS tipo_equipamento,
                      CAST ([replace](_pet_ct, "-", "0") AS INTEGER) AS qtde
                 FROM tbEqExistEstJanDez19
               UNION ALL
               SELECT mes,
                      cod_ibge,
                      municipio2,
                      'gama_camara' AS tipo_equipamento,
                      CAST ([replace](_gama_camara, "-", "0") AS INTEGER) AS qtde
                 FROM tbEqExistEstJanDez19
               UNION ALL
               SELECT mes,
                      cod_ibge,
                      municipio2,
                      'processadora_de_filme_exclusiva_para_mamografia' AS tipo_equipamento,
                      CAST ([replace](_processadora_de_filme_exclusiva_para_mamografia, "-", "0") AS INTEGER) AS qtde
                 FROM tbEqExistEstJanDez19
           )
     ORDER BY cod_ibge;


-- View: tbViewSaldoVariacaoEquipExistMun19
CREATE VIEW tbViewSaldoVariacaoEquipExistMun19 AS
    SELECT cod_ibge,
           municipio2 AS municipio,
           tipo_equipamento,
           mes,
           qtde,
           CASE WHEN (lead(qtde) OVER (PARTITION BY cod_ibge) IS NULL OR 
                      lead(qtde) OVER (PARTITION BY cod_ibge) BETWEEN -7000 AND 7000) AND 
                     mes = "dez" THEN "-" ELSE CAST (lead(qtde) OVER (PARTITION BY cod_ibge) AS INTEGER) END AS mes_post,
           CASE WHEN ( (lead(qtde) OVER (PARTITION BY cod_ibge) - qtde) IS NULL OR 
                       (lead(qtde) OVER (PARTITION BY cod_ibge) - qtde) BETWEEN -7000 AND 7000) AND 
                     mes = "dez" THEN "-" ELSE CAST ( (lead(qtde) OVER (PARTITION BY cod_ibge) - qtde) AS INTEGER) END AS saldo,
           CASE WHEN (round( (CAST (lead(qtde) OVER (PARTITION BY cod_ibge) AS INTEGER) - CAST (qtde AS INTEGER) ) / CAST (qtde AS INTEGER), 3) IS NULL OR 
                      (lead(qtde) OVER (PARTITION BY cod_ibge) - qtde) BETWEEN -7000 AND 7000) AND 
                     mes = "dez" THEN "-" WHEN (round( (CAST (lead(qtde) OVER (PARTITION BY cod_ibge) AS FLOAT) - CAST (qtde AS FLOAT) ) / CAST (qtde AS FLOAT), 3) = 0 OR 
                                                (lead(qtde) OVER (PARTITION BY cod_ibge) - qtde) = 0) AND 
                                               mes = "dez" AND 
                                               qtde BETWEEN 0 AND 7000 THEN CAST ("0" AS INTEGER) ELSE coalesce(round( (CAST (lead(qtde) OVER (PARTITION BY cod_ibge) AS FLOAT) - CAST (qtde AS FLOAT) ) / CAST (qtde AS FLOAT), 3), 0) END AS variacao
      FROM (
               SELECT mes,
                      cod_ibge,
                      municipio2,
                      'rx_comum' AS tipo_equipamento,
                      CAST ([replace]( (_raio_x_ate_100_ma + _raio_x_de_100_a_500_ma + _raio_x_mais_de_500ma), "-", "0") AS INTEGER) AS qtde
                 FROM tbEqExistMunJanDez19
               UNION ALL
               SELECT mes,
                      cod_ibge,
                      municipio2,
                      'rx_hemod' AS tipo_equipamento,
                      CAST ([replace](_raio_x_para_hemodinamica, "-", "0") AS INTEGER) AS qtde
                 FROM tbEqExistMunJanDez19
               UNION ALL
               SELECT mes,
                      cod_ibge,
                      municipio2,
                      'rx_fluor' AS tipo_equipamento,
                      CAST ([replace](_raio_x_com_fluoroscopia, "-", "0") AS INTEGER) AS qtde
                 FROM tbEqExistMunJanDez19
               UNION ALL
               SELECT mes,
                      cod_ibge,
                      municipio2,
                      'rx_dens' AS tipo_equipamento,
                      CAST ([replace](_raio_x_para_densitometria_ossea, "-", "0") AS INTEGER) AS qtde
                 FROM tbEqExistMunJanDez19
               UNION ALL
               SELECT mes,
                      cod_ibge,
                      municipio2,
                      'rx_odonto' AS tipo_equipamento,
                      CAST ([replace](_raio_x_dentario, "-", "0") AS INTEGER) AS qtde
                 FROM tbEqExistMunJanDez19
               UNION ALL
               SELECT mes,
                      cod_ibge,
                      municipio2,
                      'tomografo' AS tipo_equipamento,
                      CAST ([replace](_tomógrafo_computadorizado, "-", "0") AS INTEGER) AS qtde
                 FROM tbEqExistMunJanDez19
               UNION ALL
               SELECT mes,
                      cod_ibge,
                      municipio2,
                      'mamografo' AS tipo_equipamento,
                      CAST ([replace]( (_mamografo_computadorizado + _mamografo_com_comando_simples + _mamografo_com_estereotaxia), "-", "0") AS INTEGER) AS qtde
                 FROM tbEqExistMunJanDez19
               UNION ALL
               SELECT mes,
                      cod_ibge,
                      municipio2,
                      'ressonancia_magnetica' AS tipo_equipamento,
                      CAST ([replace](_ressonancia_magnetica, "-", "0") AS INTEGER) AS qtde
                 FROM tbEqExistMunJanDez19
               UNION ALL
               SELECT mes,
                      cod_ibge,
                      municipio2,
                      'usg' AS tipo_equipamento,
                      CAST ([replace]( (_ultrassom_convencional + _ultrassom_ecografo + _ultrassom_doppler_colorido), "-", "0") AS INTEGER) AS qtde
                 FROM tbEqExistMunJanDez19
               UNION ALL
               SELECT mes,
                      cod_ibge,
                      municipio2,
                      'pet_ct' AS tipo_equipamento,
                      CAST ([replace](_pet_ct, "-", "0") AS INTEGER) AS qtde
                 FROM tbEqExistMunJanDez19
               UNION ALL
               SELECT mes,
                      cod_ibge,
                      municipio2,
                      'gama_camara' AS tipo_equipamento,
                      CAST ([replace](_gama_camara, "-", "0") AS INTEGER) AS qtde
                 FROM tbEqExistMunJanDez19
               UNION ALL
               SELECT mes,
                      cod_ibge,
                      municipio2,
                      'processadora_de_filme_exclusiva_para_mamografia' AS tipo_equipamento,
                      CAST ([replace](_processadora_de_filme_exclusiva_para_mamografia, "-", "0") AS INTEGER) AS qtde
                 FROM tbEqExistMunJanDez19
           )
     ORDER BY cod_ibge;


-- View: tbViewTaxaEqEst19
CREATE VIEW tbViewTaxaEqEst19 AS
    SELECT eee19.cod_ibge AS cod_ibge,
           eee19.municipio AS municipio,
           eee19.tipo_equipamento AS tipo_equipamento,
           eee19.qtde AS qtde,
           round( (CAST (eee19.qtde AS REAL) / CAST (mun19.pop AS REAL) ) * 100000, 2) AS equip_por_cem_mil_hab
      FROM tbViewSaldoVariacaoEquipExistEst19 AS eee19
           INNER JOIN
           tbMunicipios AS mun19 ON eee19.cod_ibge = mun19.cod_ibge
     WHERE mes = "dez";


-- View: tbViewTaxaEqMun19
CREATE VIEW tbViewTaxaEqMun19 AS
    SELECT eem19.cod_ibge AS cod_ibge,
           eem19.municipio AS municipio,
           eem19.tipo_equipamento AS tipo_equipamento,
           eem19.qtde AS qtde,
           round( (CAST (eem19.qtde AS REAL) / CAST (mun19.pop AS REAL) ) * 100000, 2) AS equip_por_cem_mil_hab
      FROM tbViewSaldoVariacaoEquipExistMun19 AS eem19
           INNER JOIN
           tbMunicipios AS mun19 ON eem19.cod_ibge = mun19.cod_ibge
     WHERE mes = "dez";


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
