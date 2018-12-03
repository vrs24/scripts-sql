DECLARE
arquivo_ler UTL_File.File_Type;
Linha  Varchar2(100);
BEGIN
arquivo_ler  := UTL_File.Fopen('caminho completo','nm arquivo', 'r');
Loop
UTL_File.Get_Line(arquivo_ler, Linha);
/*Manipulação da linha lida*/
End Loop;
UTL_File.Fclose(arquivo_ler);
Dbms_Output.Put_Line('Arquivo processado com sucesso.');
EXCEPTION
WHEN No_data_found THEN
UTL_File.Fclose(arquivo_ler);
Commit;
WHEN UTL_FILE.INVALID_PATH THEN
Dbms_Output.Put_Line('Diretório inválido.');
UTL_File.Fclose(arquivo_ler);
WHEN Others THEN
Dbms_Output.Put_Line ('Problemas na leitura do arquivo.');
UTL_File.Fclose(arquivo_ler);
END;


