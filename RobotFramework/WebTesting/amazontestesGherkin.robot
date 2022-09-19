*** Settings ***
Documentation    Essa suite testa o site da Amazon.com.br
resource         amazon_resources.robot
Test Setup       Abrir o navegador
# Test Teardown    Fechar o navageador

*** Test Cases ***
caso de teste 1 - Acesso ao menu "OfertasDia"
  [Documentation]    Esse teste valida o acesso
  ...                ao menu OfertasDia.
  [Tags]             Menu    categorias
    Dado que estou na home page da Amazon.com.br
    Verificar se aparece a frase "Amazon.com.br | Tudo pra você, de A a Z."
    Quando acessar o menu "Ofertas do dia"
    Então o título da página deve ficar "Ofertas e Promoções"
    E a categoria "Dispositivos Amazon" deve ser exibida na página



caso de teste 2 - Pesquisa de um Produto
   [Documentation]  Esse teste valida a pesquisa
   ...              de um produto.
   [Tags]           Pesquisa

    Dado que estou na home page da Amazon.com.br
    Quando pesquisar pelo produto "Xbox Series S"
    Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
    E um produto da linha "Xbox Series S" deve ser mostrado na página

Caso de Teste 03 - Adicionar Produto no Carrinho
    [Documentation]    Esse teste verifica a adição de um produto no carrinho de compras
    [Tags]             adicionar_carrinho
    Dado que estou na home page da Amazon.com.br
    Quando adicionar o produto "Console Xbox Series S" no carrinho
    Então o produto "Console Xbox Series S" deve ser mostrado no carrinho
 
Caso de Teste 04 - Remover Produto do Carrinho
    [Documentation]    Esse teste verifica a remoção de um produto no carrinho de compras
    [Tags]             remover_carrinho
    Dado que estou na home page da Amazon.com.br
    E existe o produto "Console Xbox Series S" no carrinho
    Quando remover o produto "Console Xbox Series S" do carrinho
    Então o carrinho deve ficar vazio