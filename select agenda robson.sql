SELECT * FROM carteira
WHERE sn_carteira_ativo = 'S'


    SELECT * FROM convenio


       convenio_perfil_agendamento

       agenda_central_gru_agen_pac




SELECT DISTINCT agenda_central.cd_agenda_central,
                agenda_central.tp_agenda,
                escala_central.cd_prestador prestador_escala,
                prestador.nm_prestador

  FROM agenda_central ,
       agenda_central_convenio ,
       escala_central,
       prestador

 WHERE agenda_central.cd_escala_central = escala_central.cd_escala_central
   AND agenda_central.cd_agenda_central = agenda_central_convenio.cd_agenda_central
   AND escala_central.cd_prestador IS NOT NULL
   AND prestador.cd_prestador = escala_central.cd_prestador
   AND agenda_central_convenio.cd_convenio = 3
   --AND agenda_central.dt_agenda >= To_Date('01/01/2018', 'dd/mm/yyyy')