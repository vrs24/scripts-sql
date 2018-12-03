CREATE OR REPLACE FUNCTION f_trata_result (pTipo IN VARCHAR2, pCd_prestador IN NUMBER)
RETURN VARCHAR2 IS
vRetorno VARCHAR2(4000);
BEGIN

IF pTipo = 'especialidades' then

       SELECT REPLACE(wm_concat(ds_especialid),',', '; ') descricao
         INTO vRetorno
         FROM ( SELECT ds_especialid, sn_especial_principal
                  FROM dbamv.especialid e
                     , dbamv.esp_med em
                 WHERE em.cd_prestador = pCd_prestador
                   AND e.cd_especialid = em.cd_especialid
                 ORDER BY sn_especial_principal DESC
              );
END IF;

IF pTipo = 'emails' then

      SELECT REPLACE(wm_concat(ds_tip_comun_prest),',', '; ') descricao
        INTO vRetorno
        FROM ( SELECT ds_tip_comun_prest, t.cd_tip_comun
                 FROM dbamv.tip_comun t
                    , dbamv.prestador_tip_comun pt
                WHERE pt.cd_prestador = pCd_prestador
                  AND pt.cd_tip_comun = t.cd_tip_comun
                  AND Upper(t.ds_tip_comun) LIKE '%MAIL%'
                ORDER BY t.cd_tip_comun DESC ) ;

END IF;

IF pTipo = 'telefones' then

      SELECT REPLACE(wm_concat(ds_tip_comun_prest), ',', '; ') descricao
        INTO vRetorno
        FROM ( SELECT ds_tip_comun_prest, t.cd_tip_comun
                 FROM dbamv.tip_comun t
                    , dbamv.prestador_tip_comun pt
                WHERE pt.cd_prestador = pCd_prestador
                  AND pt.cd_tip_comun = t.cd_tip_comun
                  AND ( Upper(t.ds_tip_comun) LIKE '%FONE%' OR Upper(t.ds_tip_comun) LIKE '%CELULAR%')
                ORDER BY t.cd_tip_comun DESC );
END IF;

RETURN vRetorno;
END;