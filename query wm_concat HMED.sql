SELECT p.cd_prestador Id
     , p.nm_prestador Nome
     , p.ds_codigo_conselho Registro
     , esp.cd_especialid as IdEspecialidade
     , esp.ds_especialid as DescricaoEspecialidade
     , c.ds_conselho
     , c.cd_uf
     , f_trata_result ('especialidades', p.cd_prestador) especialidades
     , f_trata_result ('emails', p.cd_prestador) emails
     , f_trata_result ('telefones', p.cd_prestador) telefones

   FROM dbamv.especialid esp
      , dbamv.esp_med espm
      , dbamv.prestador p
      , dbamv.conselho c

  WHERE esp.cd_especialid = espm.cd_especialid
    AND espm.sn_especial_principal = 'S'
    AND p.cd_conselho = c.cd_conselho
    AND p.tp_situacao = 'A'
    AND espm.cd_prestador = p.cd_prestador
    AND c.ds_conselho IN ('CRM','CRFA','CRP', 'CREFITO', 'CRN', 'CRBM')

  GROUP BY p.cd_prestador
         , p.nm_prestador
         , p.ds_codigo_conselho
         , esp.cd_especialid
         , esp.ds_especialid
         , c.ds_conselho
         , c.cd_uf

  ORDER BY 2

--  mudar para Wm_Concat