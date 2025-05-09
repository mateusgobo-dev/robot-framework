*** Settings ***
Library     SeleniumLibrary
Library    XML

*** Variables ***
${URL}                                                            https://www.amazon.com.br/
${MENU_ELETRONICOS}                            //a[contains(text(),'Eletrônicos')]
${HEADER_ELETRONICOS}                        //title[normalize-space()='Eletrônicos e Tecnologia | Amazon.com.br']
${ITENS_INFORMATICA}                            //span[@class='a-size-base-plus'][normalize-space()='Computadores e Informática']

*** Keywords ***
Abrir o navegador
    Open Browser    browser=chrome
    Maximize Browser Window
Fechar o navegador
    Capture Page Screenshot
    Close Browser

Acessar a home page do site Amazon.com.br
    Go To    url=${URL}
    Wait Until Element Is Visible    ${MENU_ELETRONICOS}

Entrar no menu "Eletrônicos"
    Click Element    ${MENU_ELETRONICOS}
    
Verificar se aparece a frase "${TITULO}"
    Wait Until Page Contains            text=${TITULO}
    Wait Until Element Is Visible      locator=//span[contains(text(),'Eletrônicos e Tecnologia')]

Verificar se o título da página fica "${FRASE}"
    Title Should Be    title=${FRASE}

Verificar se aparece a categoria "Computadores e Informática"
    Element Should Be Visible   locator=${ITENS_INFORMATICA}

Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Input Text    locator=twotabsearchtextbox    text=${PRODUTO}

Clicar no botão de pesquisa
    Click Element   locator=nav-search-submit-button

Verificar o resultado da pesquisa, listando o produto pesquisado ${PRODUTO}
    Wait Until Element Is Visible    locator=//span[normalize-space()='${PRODUTO}']
