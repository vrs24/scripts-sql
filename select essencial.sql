SELECT sn_pgdas_03000.cod_tom
  ,sn_pgdas_03000.cnpj
  ,sn_pgdas_00000.nome
  ,sn_pgdas_03000.uf
  --sn_pgdas_03100.vltotal vl_total_1
  ,f_t1 (sn_pgdas_03000.cod_tom, sn_pgdas_03000.cnpj, 1) vltotal
  ,f_t1 (sn_pgdas_03000.cod_tom, sn_pgdas_03000.cnpj, 2) vltotal2

--INTO v_retorno
FROM sn_pgdas_00000
    ,sn_pgdas_03000
    ,sn_pgdas_03100
WHERE  sn_pgdas_00000.cod_tom = 6001
AND sn_pgdas_00000.cod_tom = sn_pgdas_03000.cod_tom
AND sn_pgdas_03100.id_sn_pgdas_03000 = sn_pgdas_03000.id
--and sn_pgdas_03100.tipo IN (08,10,11,13,14,16,17,20,22,23,26,27,28,29,30,31,32,33,35,38,40,41,42,43,44,52,54)
--AND sn_pgdas_03000.cod_tom = p_tom
--AND sn_pgdas_03000.cnpj = p_cnpj

GROUP BY sn_pgdas_03000.cod_tom
        ,sn_pgdas_03000.cnpj
        ,sn_pgdas_00000.nome
        ,sn_pgdas_03000.uf
      --  ,sn_pgdas_03100.vltotal  ;
