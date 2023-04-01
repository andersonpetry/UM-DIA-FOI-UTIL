@echo off

rem Obter a data atual em formato dd/mm/yyyy ---set data_inicio=%Date:~0,2%/%Date:~3,2%/%Date:~6,4%
set data_inicio=%DATE%

rem Obter a hora de início
set hora_incio=%TIME%

echo ==============================================================================================
echo Verifique os diretórios corretamente...	[%data_inicio%] [%hora_incio%] 
echo ==============================================================================================

setlocal enabledelayedexpansion
rem utilize sempre aspas duplas para evitar erros de projetos com nomes especiais
set DIRS="C:\GIT-PROJETOS"
 
for %%d in (%DIRS%) do (

    setlocal enabledelayedexpansion
    	
	echo.
    echo Atualizando o repositório em %%d... 
    cd /d "%%d" 
    set repoName=%%~nd
	  set repoNameFinal=%%~nxd
	
	REM Se o ramo padrão em seu projeto é "main", você pode simplesmente executar um comando "git pull" para atualizar o ramo atual com as alterações mais recentes.Caso você precise mudar de ramo antes de fazer um "git pull", você pode usar o comando "git checkout" para mudar para o ramo "main". O comando seria:
	
	git checkout main
	echo.
  
	git pull origin main
	echo.
	
    if errorlevel 1 (
        echo ATENÇÃO ...
		echo Houve um erro ao atualizar o repositório em %%d. Pressione qualquer tecla para continuar...
        pause > nul
    )else (
		echo ---------------------------
		echo.
		echo O repositório em %%d foi atualizado com sucesso...
		echo.
	)
	echo.
	echo Listando os 2 ultimos checking...
	echo.
	git log -3 --pretty="%%h %%cr | %%s [%%an]" --date=local
	echo ---------------------------
	 
	echo.
	echo ==============================================================================================
	
    endlocal
)

set hora_fim=%TIME%
echo ===============================================

echo Todas as atualizações foram concluídas. [%hora_fim%] Pressione ENTER para sair...

echo ===============================================

pause > nul
