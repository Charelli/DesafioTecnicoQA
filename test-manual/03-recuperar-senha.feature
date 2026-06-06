# language: pt
Funcionalidade: Recuperação de senha
  Como pessoa paciente
  Quero recuperar minha senha
  Para voltar a acessar minha conta com segurança

  Cenário: Acessar recuperação de senha
    Dado que a pessoa usuária esteja na tela de login da plataforma
    Quando clicar na opção "Esqueci minha senha"
    Então o sistema deve redirecionar para a página de recuperação de senha
    E devo visualizar o campo "E-mail"
    E devo visualizar a ação para enviar instruções de recuperação

  Esquema do Cenário: Solicitar recuperação de senha
    Dado que a pessoa usuária esteja na página de recuperação de senha
    Quando inserir "<email>" no campo "E-mail"
    E clicar no botão de enviar
    Então o sistema deve exibir "<resultado>"

    Exemplos:
      | email               | resultado                                                                          |
      | usuario@email.com   | mensagem informando que as instruções serão enviadas se o e-mail existir           |
      | naoexiste@email.com | não foi possivel enviar o link para o seu e-mail                                   |
      |                     | este campo é obrigatório                                                           |
      | emailinvalido       | por favor, utilize um endereço de e-mail válido. Por exemplo: email@dominio.com.br |

  Cenário: Acessar link válido de recuperação de senha
    Dado que a pessoa usuária solicitou a recuperação de senha com e-mail cadastrado
    E recebeu um link válido de redefinição
    Quando acessar o link de redefinição de senha
    Então o sistema deve redirecionar para a página de redefinição de senha
    E devo visualizar os campos "Nova senha" e "Confirme sua nova senha"

  Esquema do Cenário: Redefinir senha
    Dado que a pessoa usuária esteja na página de redefinição de senha
    Quando inserir "<senha>" no campo "Nova senha"
    E inserir "<confirmacao>" no campo "Confirme sua nova senha"
    E clicar no botão de redefinir senha
    Então o sistema deve exibir "<resultado>"

    Exemplos:
      | senha     | confirmacao | resultado                                       |
      | Senha@123 | Senha@123   | mensagem de sucesso e senha atualizada          |
      | Senha@123 | Senha@124   | mensagem informando que as senhas não coincidem |
      | senha     | senha       | mensagem informando requisitos de segurança     |
      |           | Senha@123   | mensagem solicitando preenchimento da senha     |
      | Senha@123 |             | mensagem solicitando confirmação da senha       |

  Cenário: Link de recuperação expirado
    Dado que a pessoa usuária recebeu um link de recuperação de senha
    E o link expirou após o tempo limite
    Quando tentar acessar o link
    Então o sistema deve informar que o link expirou
    E deve orientar a solicitar uma nova recuperação de senha

  Cenário: Link de recuperação inválido
    Dado que a pessoa usuária possui um link de recuperação inválido
    Quando tentar acessar o link
    Então o sistema deve informar que o link é inválido
    E deve orientar a solicitar uma nova recuperação de senha

  Cenário: Link de recuperação já utilizado
    Dado que a pessoa usuária já redefiniu a senha usando um link de recuperação
    Quando tentar acessar o mesmo link novamente
    Então o sistema deve informar que o link não pode mais ser utilizado
    E deve orientar a solicitar uma nova recuperação de senha

  Cenário: Redefinir senha utilizando a senha antiga
    Dado que a pessoa usuária esteja na página de redefinição de senha
    Quando inserir a mesma senha utilizada anteriormente
    E confirmar a mesma senha
    E clicar no botão de redefinir senha
    Então o sistema deve exibir uma mensagem informando que a nova senha deve ser diferente da senha anterior

  Cenário: Acessar conta após redefinir senha com sucesso
    Dado que a pessoa usuária redefiniu a senha com sucesso
    Quando acessar a tela de login
    E realizar login com a nova senha
    Então deve ser autenticada com sucesso
    E deve ser direcionada para a área logada da plataforma

  Cenário: Não permitir login com senha antiga após redefinição
    Dado que a pessoa usuária redefiniu a senha com sucesso
    Quando acessar a tela de login
    E tentar realizar login com a senha antiga
    Então o sistema deve negar o acesso
    E deve exibir mensagem de e-mail ou senha incorretos
