# language: pt
Funcionalidade: Login e cadastro mobile de paciente
  Como pessoa paciente
  Quero acessar ou criar minha conta
  Para utilizar os serviços da Lacrei Saúde em dispositivo mobile

  Contexto:
    Dado que estou usando um dispositivo mobile com viewport 390x844

  Cenário: Abrir tela de login
    Quando acesso "https://paciente-staging.lacreisaude.com.br/login/"
    Então devo visualizar a tela "Boas-vindas à Lacrei Saúde"
    E devo visualizar os campos "E-mail" e "Senha"
    E devo visualizar as ações "Entrar", "Criar conta" e "Esqueci minha senha"

  Cenário: Realizar login com credenciais válidas
    Dado que estou na tela de login
    Quando preencho o campo "E-mail" com um e-mail válido cadastrado
    E preencho o campo "Senha" com uma senha válida
    E aciono "Entrar"
    Então devo ser autenticado com sucesso
    E devo ser direcionado para a área logada da plataforma

  Esquema do Cenário: Validar campos obrigatórios no login
    Dado que estou na tela de login
    Quando preencho o campo "E-mail" com "<email>"
    E preencho o campo "Senha" com "<senha>"
    E aciono "Entrar"
    Então devo visualizar a mensagem de campo obrigatório para "<campo>"

    Exemplos:
      | email             | senha       | campo          |
      | vazio             | vazio       | E-mail e Senha |
      | vazio             | Senha12345! | E-mail         |
      | teste@exemplo.com | vazio       | Senha          |

  Esquema do Cenário: Validar e-mail inválido no login
    Dado que estou na tela de login
    Quando preencho o campo "E-mail" com "<email>"
    E preencho o campo "Senha" com "Senha12345!"
    E aciono "Entrar"
    Então devo visualizar a mensagem "Por favor, utilize um formato de e-mail válido. Por exemplo: email@dominio.com.br."

    Exemplos:
      | email      |
      | abc        |
      | @gmail.com |
      | teste@     |
      | a@b.c      |

  Esquema do Cenário: Tentar login com credenciais inválidas
    Dado que estou na tela de login
    Quando preencho o campo "E-mail" com "<email>"
    E preencho o campo "Senha" com "<senha>"
    E aciono "Entrar"
    Então devo permanecer na tela de login
    E devo visualizar a mensagem "E-mail ou senha incorretos. Esqueceu a sua senha? Clique em \"Esqueci minha senha\" para recuperá-la."

    Exemplos:
      | email                                 | senha         |
      | usuario.inexistente.teste@exemplo.com | Senha12345!   |
      | usuario.valido@exemplo.com            | SenhaErrada1! |
      | usuario.errado@exemplo.com            | Senha12345!   |

  Cenário: Exibir e ocultar senha no login
    Dado que estou na tela de login
    E preencho o campo "Senha" com "Senha12345!"
    Quando aciono "Exibir / ocultar senha"
    Então a senha deve ficar visível
    Quando aciono "Exibir / ocultar senha" novamente
    Então a senha deve voltar a ficar oculta
    E o valor da senha deve ser preservado

  Cenário: Acessar criação de conta
    Dado que estou na tela de login
    Quando aciono "Criar conta"
    Então devo ser direcionado para "/saude/paciente/cadastrar/"
    E devo visualizar a tela "Crie sua conta na Lacrei Saúde"

  Cenário: Validar campos obrigatórios no cadastro
    Dado que estou na tela de cadastro
    Quando tento prosseguir sem preencher os campos obrigatórios
    Então devo visualizar mensagem de campo obrigatório para "Nome civil ou social"
    E devo visualizar mensagem de campo obrigatório para "Sobrenome"
    E devo visualizar mensagem de campo obrigatório para "E-mail"
    E devo visualizar mensagem de campo obrigatório para "Confirme seu e-mail"
    E devo visualizar mensagem de campo obrigatório para "Senha"
    E devo visualizar mensagem de campo obrigatório para "Confirme sua senha"

  Cenário: Cadastro com dados válidos
    Dado que estou na tela de cadastro
    Quando preencho todos os campos obrigatórios com dados válidos e e-mail ainda não cadastrado
    E marco a opção "Li e concordo com os Termos de uso e Política de privacidade"
    E marco a opção "Tenho 18 anos ou mais"
    E aciono "Cadastrar"
    Então o sistema deve criar uma nova conta
    E devo visualizar a tela informando o envio do link de verificação para o e-mail cadastrado

  Cenário: Validar divergência entre e-mails no cadastro
    Dado que estou na tela de cadastro
    Quando preencho o campo "E-mail" com "teste1@exemplo.com"
    E preencho o campo "Confirme seu e-mail" com "teste2@exemplo.com"
    Então devo visualizar a mensagem "Os e-mails não correspondem, digite novamente."

  Cenário: Validar e-mail já cadastrado
    Dado que estou na tela de cadastro
    Quando preencho o campo "E-mail" com um e-mail já cadastrado
    E preencho os demais campos obrigatórios com dados válidos
    E marco a opção "Li e concordo com os Termos de uso e Política de privacidade"
    E marco a opção "Tenho 18 anos ou mais"
    E aciono "Cadastrar"
    Então devo visualizar a mensagem "Já existe um usuário cadastrado com este endereço de e-mail"

  Cenário: Validar divergência entre senhas no cadastro
    Dado que estou na tela de cadastro
    Quando preencho o campo "Senha" com "Senha12345!"
    E preencho o campo "Confirme sua senha" com "OutraSenha123!"
    Então devo visualizar a mensagem "Senhas incompatíveis, tente novamente."

  Esquema do Cenário: Validar senha inválida no cadastro
    Dado que estou na tela de cadastro
    Quando preencho o campo "Senha" com "<senha>"
    E preencho os demais campos obrigatórios com dados válidos
    E aciono "Cadastrar"
    Então o sistema deve indicar que a senha não atende aos critérios de segurança
    E devo visualizar os critérios não atendidos destacados em vermelho

    Exemplos:
      | senha     |
      | senha@123 |
      | SENHA@123 |
      | Senha123  |
      | Senh@1    |

  Esquema do Cenário: Validar nome inválido no cadastro
    Dado que estou na tela de cadastro
    Quando preencho o campo "Nome civil ou social" com "<nome>"
    E preencho os demais campos obrigatórios com dados válidos
    E aciono "Cadastrar"
    Então devo visualizar a mensagem "Digite um nome válido"

    Exemplos:
      | nome       |
      | João@Silva |
      | Joao123    |
      |      12345 |

  Esquema do Cenário: Validar aceite de termos e maioridade no cadastro
    Dado que estou na tela de cadastro
    Quando preencho todos os campos obrigatórios com dados válidos
    E configuro o aceite de termos como "<termos>"
    E configuro a confirmação de maioridade como "<maioridade>"
    E aciono "Cadastrar"
    Então devo visualizar as mensagens de validação correspondentes aos aceites obrigatórios não marcados

    Exemplos:
      | termos | maioridade |
      | não    | sim        |
      | sim    | não        |
      | não    | não        |
