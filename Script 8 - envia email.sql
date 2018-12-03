SET serveroutput on
declare
v_seq_estrutura number ;
v_seq_grupo number ;
v_email_gestor varchar2(300);
v_email_funcionario varchar2(300);
v_nome_funcionario varchar2(300);

begin

  select nvl(MAX(SEQ_AVAL_GRUPO),0)
    INTO v_seq_grupo
    from AVAL_GRUPO
   where SEQ_FUNCIONARIO = 27
     AND seq_periodo = 21 ;

   Dbms_Output.put_line('v_seq_grupo: '||v_seq_grupo);

   SELECT nvl(MAX(SEQ_AVAL_estrutura),0)
     into v_seq_estrutura
     FROM aval_estrutura
    WHERE seq_aval_grupo = v_seq_grupo
      AND tipo_aval = 'G';

  Dbms_Output.put_line('v_seq_estrutura: '||v_seq_estrutura);



  prc_grava_aval_estrutura ( '@@pergunta_241;100;t@@pergunta_282;100;tttttt@@pergunta_281;100;t@@pergunta_302;100;ttt@@pergunta_301;100;tttt',             --p_valores_respostas
                             27,                          --p_seq_funcionario
                             23,                          --p_seq_funcionario_criou
                             v_seq_grupo,                 --p_seq_aval_grupo
                             v_seq_estrutura,             --p_seq_aval_estrutura
                             21,                          --p_aval_estrutura_periodo
                             'TESTE',                     --p_txt_consideracoes
                             'FINALIZAR',                 --p_tipo_operacao
                             'G',                         --p_tipo_aval
                             '2'
                           );


 if 'G' = 'G' then


    SELECT email
    INTO v_email_gestor
    FROM funcionario
    WHERE seq_funcionario = 23;

    Dbms_Output.put_line('v_email_gestor: '||v_email_gestor);



    SELECT email
    INTO v_email_funcionario
    FROM funcionario
    WHERE seq_funcionario = 27;

    Dbms_Output.put_line('v_email_funcionario: '||v_email_funcionario);


    select nome
    into v_nome_funcionario
    from funcionario
    where seq_funcionario = 27;

    Dbms_Output.put_line('v_nome_funcionario: '||v_nome_funcionario);



     email_to_face.send( v_email_gestor ,
			       	     v_email_funcionario ,
				         'Agendar Feedback' ,
				         ' Prezado(a) '||v_nome_funcionario||', seu feedback foi agendado para o dia '||to_char(to_date('05/09/2018','dd/mm/yyyy'), 'dd/mm/yyyy')||'.' );




 end if;


END;

