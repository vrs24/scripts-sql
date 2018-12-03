--opcao 1

SELECT sn_pgdas_03000.cod_tom
  ,sn_pgdas_03000.cnpj
  ,sn_pgdas_00000.nome
  ,sn_pgdas_03000.uf
  ,sn_pgdas_03100.vltotal vl_total_1
  , NULL vl_total_2

FROM sn_pgdas_00000
    ,sn_pgdas_03000
    ,sn_pgdas_03100
WHERE  sn_pgdas_00000.cod_tom = 6001
AND sn_pgdas_00000.cod_tom = sn_pgdas_03000.cod_tom
AND sn_pgdas_03100.id_sn_pgdas_03000 = sn_pgdas_03000.id
and sn_pgdas_03100.tipo IN (08,10,11,13,14,16,17,20,22,23,26,27,28,29,30,31,32,33,35,38,40,41,42,43,44,52,54)

GROUP BY sn_pgdas_03000.cod_tom
        ,sn_pgdas_03000.cnpj
        ,sn_pgdas_00000.nome
        ,sn_pgdas_03000.uf
        ,sn_pgdas_03100.vltotal

--opcao 2

SELECT sn_pgdas_03000.cod_tom
  ,sn_pgdas_03000.cnpj
  ,sn_pgdas_00000.nome
  ,sn_pgdas_03000.uf
  ,NULL vl_total_1
  ,sn_pgdas_03100.vltotal vl_total_2

FROM sn_pgdas_00000
    ,sn_pgdas_03000
    ,sn_pgdas_03100
WHERE  sn_pgdas_00000.cod_tom = 6001
AND sn_pgdas_00000.cod_tom = sn_pgdas_03000.cod_tom
AND sn_pgdas_03100.id_sn_pgdas_03000 = sn_pgdas_03000.id
and sn_pgdas_03100.tipo IN (11, 14, 17, 23, 30, 33, 36, 39, 53)

GROUP BY sn_pgdas_03000.cod_tom
        ,sn_pgdas_03000.cnpj
        ,sn_pgdas_00000.nome
        ,sn_pgdas_03000.uf
        ,sn_pgdas_03100.vltotal

--opcao 3

SELECT sn_pgdas_03000.cod_tom
  ,sn_pgdas_03000.cnpj
  ,sn_pgdas_00000.nome
  ,sn_pgdas_03000.uf
  ,NULL vl_total_1
  ,sn_pgdas_03100.vltotal vl_total_2

FROM sn_pgdas_00000
    ,sn_pgdas_03000
    ,sn_pgdas_03100
WHERE  sn_pgdas_00000.cod_tom = 6001
AND sn_pgdas_00000.cod_tom = sn_pgdas_03000.cod_tom
AND sn_pgdas_03100.id_sn_pgdas_03000 = sn_pgdas_03000.id
and sn_pgdas_03100.tipo IN (09,12,15,24,28,31,34,37,51)

GROUP BY sn_pgdas_03000.cod_tom
        ,sn_pgdas_03000.cnpj
        ,sn_pgdas_00000.nome
        ,sn_pgdas_03000.uf
        ,sn_pgdas_03100.vltotal