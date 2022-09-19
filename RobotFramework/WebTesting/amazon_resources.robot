*** Settings ***
Library   SeleniumLibrary

*** Variables ***
${Browser}          chrome
${URL}              http://www.amazon.com.br
${OfertasDia}       //a[contains(.,'Ofertas do Dia')]
${Texto}            Saldão do Cliente | Amazon.com.br 

*** Keywords ***
Abrir o navegador
    Open Browser    browser=${Browser}
    Maximize Browser Window

Fechar o navageador
    Capture Page Screenshot
    Close Browser    

Acessar a home page do site Amazon.com.br
    Go To                                  url=${URL}
    Wait Until Element Is Visible          locator=${OfertasDia}    timeout=10
Entrar no menu "Ofertas do dia"
    Click Element                          locator=${OfertasDia}
Verificar se o título da página fica "${Texto}"
    Wait Until Page Contains               text=${Texto}    
Verificar se aparece a frase "${Título}"
    Title Should Be    title=${Título}

Verificar se aparece a categoria "${Categoria}"
    Element Should Be Visible    locator=//span[@class='GridPresets-module__gridPresetsLargeItem_2xPgV2VoJCncjGPj18in1h'][contains(.,'${Categoria}')]
                                         
Digitar o nome de produto "${Produto}" no campo de pesquisa
    Input Text      locator=twotabsearchtextbox    text=${Produto}
Clicar no botão de pesquisa
    Click Element   locator=nav-search-submit-button
Verificar o resultado da pesquisa se está listando o produto "${Produto}"
    Wait Until Element Is Visible    locator=(//span[contains(.,'${Produto}')])[2]
Adicionar o produto "Console Xbox Series S" no carrinho
    Click Element    locator=//span[@class='a-size-base a-color-base a-text-normal'][contains(.,'Console Xbox Series S')]
    Click Element    locator=//input[contains(@name,'submit.add-to-cart')]
Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso
    Wait Until Element Is Visible     locator=//span[@class='a-size-medium-plus a-color-base sw-atc-text a-text-bold'][contains(.,'Adicionado ao carrinho')]    
Remover o produto "Console Xbox Series S" do carrinho
    Click Element    locator=//span[@aria-hidden='true'][contains(.,'Carrinho')]
    Click Button     locator=//input[@value='Excluir']
Verificar se o carrinho fica vazio
    Wait Until Page Contains    text=Seu carrinho de compras da Amazon está vazio
#Gherkin steps
Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br
    Verificar se aparece a frase "Amazon.com.br | Tudo pra você, de A a Z."
Quando acessar o menu "Ofertas do dia"
    Entrar no menu "Ofertas do dia"
Então o título da página deve ficar "Ofertas e Promoções"
    Verificar se o título da página fica "${Texto}"
E a categoria "${Categoria}" deve ser exibida na página
    Verificar se aparece a categoria "${Categoria}"
Quando pesquisar pelo produto "Xbox Series S"
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
    Verificar se o título da página fica "Amazon.com.br : Xbox Series S" 
E um produto da linha "Xbox Series S" deve ser mostrado na página
    Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"  
 Quando adicionar o produto "Console Xbox Series S" no carrinho
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Adicionar o produto "Console Xbox Series S" no carrinho
Então o produto "Console Xbox Series S" deve ser mostrado no carrinho
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso
E existe o produto "Console Xbox Series S" no carrinho
    Quando adicionar o produto "Console Xbox Series S" no carrinho
    Então o produto "Console Xbox Series S" deve ser mostrado no carrinho

Quando remover o produto "Console Xbox Series S" do carrinho
    Remover o produto "Console Xbox Series S" do carrinho
Então o carrinho deve ficar vazio
    Verificar se o carrinho fica vazio
    
