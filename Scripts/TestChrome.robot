*** Settings ***
Documentation     Esse script de automação utiliza a biblioteca SikuliLibrary para automatizar ações no Google Chrome. Ele abre o navegador, navega pelo menu e acessa as configurações de idioma.
Library           SikuliLibrary    mode=NEW
Suite Setup         Run Keywords    Start Sikuli Process    AND    Carregue Imagens
Suite Teardown      Stop Remote Server

#Importante colocar as Keywords e seus caminho de imagem nos Settings para o script funcionar.

*** Variables ***
${OPEN_APP}             "C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe"
${IMAGE_PATH}           ${EXECDIR}\\elements

#Verifique o caminho do executável do Google Chrome (OPEN_APP) e o caminho da pasta das imagens(IMAGE_PATH) e altere caso necessário.

*** Test Cases ***
Execute Sikuli Script
    Abrir Chrome
    Abrir Menu
    Abrir configurações
    Abrir Idiomas

*** Keywords ***
Carregue Imagens 
    Add Image Path    ${IMAGE_PATH}    #keyword do caminho da pasta de imagens

Abrir Chrome
    Open Application    ${OPEN_APP}    #abre o chrome

Abrir Menu
    Click    menu.png    #abre menu do chrome

Abrir configurações
    Click    config.png    #clica nas configurações
    Wait Until Screen Contain    validar_menu.png    10    #valida o menu de configurações

Abrir idiomas
    Click    idiomas.png    #clica no menu de idiomas
    Wait Until Screen Contain    valida_idioma.png    10    #valida o menu de idiomas