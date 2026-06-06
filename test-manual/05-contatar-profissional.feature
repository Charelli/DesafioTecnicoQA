# language: pt
Funcionalidade: Contatar profissional
  Como pessoa paciente
  Quero informar meu telefone e validar o código recebido
  Para iniciar o agendamento com o profissional escolhido

  Contexto:
    Dado que a pessoa usuária realizou uma busca por profissionais
    E selecionou um profissional da lista de resultados
    E está na página de contato do profissional

  Cenário: Exibir informações do profissional selecionado
    Quando a página de contato for carregada
    Então o sistema deve exibir o nome do profissional
    E deve exibir o número de registro profissional
    E deve exibir os atributos do profissional
    E deve exibir o valor da consulta
    E deve exibir o tipo de consulta disponível
    E deve exibir a informação de convênio ou atendimento particular

  Esquema do Cenário: Validar telefone para contato
    Quando a pessoa usuária inserir "<telefone>" no campo de contato
    E clicar no botão de enviar mensagem
    Então o sistema deve exibir "<resultado>"

    Exemplos:
      | telefone      | resultado                                      |
      |   11987654321 | mensagem informando envio do código por SMS    |
      |               | mensagem informando que o campo é obrigatório  |
      |      11555422 | mensagem informando número de celular inválido |
      |    1198765432 | mensagem informando número de celular inválido |
      |  119876543210 | mensagem informando número de celular inválido |
      | abcdefghijk   | mensagem informando número de celular inválido |
      | 11 1 11111111 | mensagem informando número de celular inválido |

  Cenário: Enviar telefone válido para receber código
    Quando a pessoa usuária inserir um telefone celular válido no campo de contato
    E clicar no botão de enviar mensagem
    Então o sistema deve enviar um código de verificação por SMS
    E deve exibir o campo para inserir o código recebido

  Cenário: Inserir código de verificação válido
    Dado que a pessoa usuária enviou seu telefone para contato
    E recebeu um código de verificação válido
    Quando inserir o código recebido no campo de verificação
    E clicar no botão de confirmar
    Então o sistema deve validar o código
    E abrir a tela de agendamento de consulta com o profissional selecionado

  Esquema do Cenário: Validar código de verificação inválido ou incompleto
    Dado que a pessoa usuária enviou seu telefone para contato
    E recebeu um código de verificação
    Quando inserir "<codigo>" no campo de verificação
    E tentar confirmar o código
    Então o sistema deve apresentar "<resultado>"

    Exemplos:
      | codigo | resultado                                                                     |
      | 000000 | codigo incorreto.Verifique se digitou corretamente ou solicite um novo código |
      |    123 | confirmação indisponível até preencher o código completo                      |
      |        | confirmação indisponível até preencher o código completo                      |

  Cenário: Reenviar código de verificação
    Dado que a pessoa usuária enviou seu telefone para contato
    E não recebeu o código de verificação
    Quando clicar no botão de reenviar código
    Então o sistema deve enviar um novo código para o telefone informado
    E deve exibir a mensagem "Um novo código foi enviado para o seu telefone."

  Cenário: Limite de tentativas de código inválido
    Dado que a pessoa usuária recebeu um código de verificação
    Quando inserir códigos inválidos várias vezes consecutivas
    Então o sistema deve bloquear temporariamente novas tentativas
    E informar que o limite de tentativas foi atingido

  Cenário: Exibir confirmação após agendamento de consulta realizado com sucesso
    Dado que a pessoa usuária validou seu telefone de contato
    E está na tela de agendamento do profissional selecionado
    Quando selecionar uma data disponível
    E selecionar um horário disponível
    E clicar no botão "Agendar consulta"
    Então o sistema deve realizar o agendamento com sucesso
    E deve exibir uma mensagem de confirmação do agendamento
    E deve apresentar os detalhes da consulta agendada

  Cenário: Exibir detalhes da consulta após agendamento realizado
    Dado que a pessoa usuária concluiu um agendamento com sucesso
    Então o sistema deve exibir o nome do profissional
    E deve exibir a data da consulta
    E deve exibir o horário da consulta
    E deve exibir o tipo de atendimento
