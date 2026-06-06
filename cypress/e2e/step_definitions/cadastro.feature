Feature: Cadastro de pessoa usuária

  Scenario: Cadastro com dados válidos
    Given que a pessoa usuária esteja na página de login
    When clicar no link "Criar conta"
    Then a pessoa usuária deve ser redirecionada para a página de cadastro
    When preencher o campo nome com "Joao"
    And preencher o campo sobrenome com "Silva"
    And preencher o campo email com "email dinamico"
    And preencher o campo senha com "Senha123!"
    And aceitar os termos de uso
    And confirmar a idade mínima
    And clicar no botão "Cadastrar"
    Then o sistema deve criar uma nova conta
    And exibir a mensagem "Enviamos um link de verificação para seu email"
