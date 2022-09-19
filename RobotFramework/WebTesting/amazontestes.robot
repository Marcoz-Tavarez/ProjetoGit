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
    Acessar a home page do site Amazon.com.br
    Verificar se aparece a frase "Amazon.com.br | Tudo pra você, de A a Z."
    Entrar no menu "Ofertas do dia"
    Verificar se o título da página fica "Ofertas e Promoções"
    Verificar se aparece a frase "Ofertas e Promoções | Amazon.com.br"
    Verificar se aparece a categoria "Dispositivos Amazon e Acessórios"
    Verificar se aparece a categoria "Automotivo"

caso de teste 2 - Pesquisa de um Produto
   [Documentation]  Esse teste valida a pesquisa
   ...              de um produto.
   [Tags]           Pesquisa
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"

Caso de Teste 03 - Adicionar Produto no Carrinho
    [Documentation]    Esse teste verifica a adição de um produto no carrinho de compras
    [Tags]             adicionar_carrinho
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"
    Adicionar o produto "Console Xbox Series S" no carrinho
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso
 
Caso de Teste 04 - Remover Produto do Carrinho
    [Documentation]    Esse teste verifica a remoção de um produto no carrinho de compras
    [Tags]             remover_carrinho
    Acessar a home page do site Amazon.com.br
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"
    Adicionar o produto "Console Xbox Series S" no carrinho
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso
    Remover o produto "Console Xbox Series S" do carrinho
    Verificar se o carrinho fica vazio

