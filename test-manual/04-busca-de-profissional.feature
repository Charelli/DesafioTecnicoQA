# language: pt
Funcionalidade: Busca de profissional
  Como pessoa paciente
  Quero buscar profissionais por especialidade
  Para encontrar atendimentos compatíveis com minha necessidade

  Contexto:
    Dado que a pessoa usuária esteja na página de busca de profissionais

  Esquema do Cenário: Buscar profissional por especialidade válida
    Quando a pessoa usuária digitar "<profissao>" no campo de busca
    E clicar no botão de buscar
    Então o sistema deve exibir profissionais relacionados à especialidade buscada

    Exemplos:
      | profissao     |
      | médico        |
      | dentista      |
      | nutricionista |
      | psicólogo     |

  Cenário: Buscar profissional pressionando Enter
    Quando a pessoa usuária digitar "psicólogo" no campo de busca
    E pressionar a tecla Enter
    Então o sistema deve exibir profissionais relacionados à especialidade buscada

  Cenário: Buscar profissionais sem informar termo de pesquisa
    Quando a pessoa usuária deixar o campo de busca vazio
    E clicar no botão de buscar
    Então o sistema deve exibir a lista de profissionais disponíveis

  Cenário: Buscar profissional com especialidade inexistente
    Quando a pessoa usuária digitar "especialidadeinexistente" no campo de busca
    E clicar no botão de buscar
    Então o sistema deve exibir a mensagem "Não encontramos o que você procura"

  Esquema do Cenário: Validar busca com termo inválido
    Quando a pessoa usuária digitar "<termo>" no campo de busca
    E clicar no botão de buscar
    Então o sistema deve tratar a busca como inválida

    Exemplos:
      | termo |
      | @#!!  |
      | 12345 |
      | $$$   |

  Esquema do Cenário: Validar busca por valor limite do campo
    Quando a pessoa usuária digitar um termo com "<quantidade>" caracteres no campo de busca
    E clicar no botão de buscar
    Então o sistema deve exibir "<resultado>"

    Exemplos:
      | quantidade | resultado                          |
      |          1 | não encontramos o que você procura |
      |          2 | não encontramos o que você procura |
      |        200 | não encontramos o que você procura |
      |        201 | mensagem de busca inválida         |

  Esquema do Cenário: Validar busca com variações de escrita
    Quando a pessoa usuária digitar "<termo>" no campo de busca
    E clicar no botão de buscar
    Então o sistema deve exibir profissionais relacionados à especialidade buscada

    Exemplos:
      | termo     |
      | Psicólogo |
      | psicologo |
      | psicólogo |

  Esquema do Cenário: Validar regras de busca por tabela de decisão
    Quando a pessoa usuária preencher o campo de busca com "<termo>"
    E acionar a busca
    Então o sistema deve apresentar "<resultado>"

    Exemplos:
      | termo                    | resultado                                  |
      | psicólogo                | profissionais relacionados à especialidade |
      | especialidadeinexistente | mensagem de nenhum resultado encontrado    |
      | @#!!                     | mensagem de busca inválida                 |
      | texto com 201 caracteres | mensagem de busca inválida                 |
