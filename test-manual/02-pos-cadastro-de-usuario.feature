# language: pt

Funcionalidade: Pós-cadastro da pessoa usuária
  Como pessoa usuária recém-cadastrada
  Quero completar minhas informações de perfil
  Para personalizar minha experiência na plataforma

  Contexto:
    Dado que a pessoa usuária esteja no fluxo de pós-cadastro

  Esquema do Cenário: Avançar etapa com opção válida selecionada
    Quando a pessoa usuária estiver na etapa "<etapa>"
    E selecionar uma opção válida
    E clicar no botão "Próximo"
    Então o sistema deve avançar para a próxima etapa
    E deve atualizar o progresso do fluxo

    Exemplos:
      | etapa       |
      | pronome     |
      | etnia       |
      | gênero      |
      | sexualidade |
      | deficiência |

  Esquema do Cenário: Impedir avanço sem seleção obrigatória
    Quando a pessoa usuária estiver na etapa "<etapa>"
    E clicar no botão "Próximo" sem selecionar nenhuma opção
    Então o sistema deve exibir a mensagem "Por favor, selecione uma das opções disponíveis"
    E deve permanecer na etapa atual

    Exemplos:
      | etapa       |
      | pronome     |
      | etnia       |
      | gênero      |
      | sexualidade |
      | deficiência |

  Esquema do Cenário: Validar progresso exibido por etapa
    Quando a pessoa usuária estiver na etapa "<etapa>"
    Então o sistema deve indicar o progresso "<progresso>"

    Exemplos:
      | etapa       | progresso |
      | pronome     |    1 de 5 |
      | etnia       |    2 de 5 |
      | gênero      |    3 de 5 |
      | sexualidade |    4 de 5 |
      | deficiência |    5 de 5 |

  Esquema do Cenário: Retornar para etapa anterior mantendo dados
    Dado que a pessoa usuária selecionou uma opção válida na etapa atual
    Quando estiver na etapa "<etapa_atual>"
    E clicar no botão "Voltar"
    Então o sistema deve retornar para a etapa "<etapa_anterior>"
    E deve manter a seleção realizada anteriormente
    E deve atualizar o progresso para "<progresso_anterior>"

    Exemplos:
      | etapa_atual | etapa_anterior | progresso_anterior |
      | etnia       | pronome        |             1 de 5 |
      | gênero      | etnia          |             2 de 5 |
      | sexualidade | gênero         |             3 de 5 |
      | deficiência | sexualidade    |             4 de 5 |

  Esquema do Cenário: Selecionar opção "Outra" com preenchimento obrigatório
    Quando a pessoa usuária estiver na etapa "<etapa>"
    E selecionar a opção "Outra"
    Então o sistema deve exibir um campo de texto para especificação
    Quando clicar no botão "Próximo" sem preencher o campo de especificação
    Então o sistema deve exibir mensagem solicitando o preenchimento da especificação
    Quando preencher o campo de especificação
    E clicar no botão "Próximo"
    Então o sistema deve permitir avançar para a próxima etapa

    Exemplos:
      | etapa       |
      | pronome     |
      | etnia       |
      | gênero      |
      | sexualidade |
      | deficiência |

  Esquema do Cenário: Validar comportamento de seleção única
    Quando a pessoa usuária estiver na etapa "<etapa>"
    E selecionar uma opção
    E selecionar outra opção diferente
    Então o sistema deve manter apenas a última opção selecionada

    Exemplos:
      | etapa       |
      | pronome     |
      | etnia       |
      | gênero      |
      | sexualidade |

  Esquema do Cenário: Validar regras de seleção na etapa deficiência
    Quando a pessoa usuária configurar as opções de deficiência como "<seleção>"
    E clicar no botão "Próximo"
    Então o sistema deve apresentar "<resultado>"

    Exemplos:
      | seleção                                    | resultado                                  |
      | uma deficiência                            | deve permitir avançar para a próxima etapa |
      | mais de uma deficiência                    | deve permitir avançar para a próxima etapa |
      | Não possuo deficiência                     | deve permitir avançar para a próxima etapa |
      | Não possuo deficiência e outra deficiência | deve impedir a seleção simultânea          |

  Cenário: Acessar informações de ajuda
    Quando a pessoa usuária clicar no ícone de ajuda
    Então o sistema deve exibir informações de suporte sobre a etapa atual

  Cenário: Exibir página de confirmação após concluir pós-cadastro
    Quando a pessoa usuária preencher todas as etapas obrigatórias
    E clicar no botão "Próximo" na última etapa
    Então o sistema deve exibir uma página de confirmação
    E deve apresentar as informações selecionadas durante o fluxo

  Cenário: Editar informações após concluir pós-cadastro
    Dado que a pessoa usuária está na página de confirmação
    Quando clicar no botão "Editar"
    Então o sistema deve permitir retornar às etapas de pós-cadastro
    Quando atualizar as informações
    E concluir novamente o pós-cadastro
    Então o sistema deve atualizar os dados exibidos na página de confirmação

  Cenário: Retomar fluxo de pós-cadastro após abandono
    Dado que a pessoa usuária iniciou o fluxo de pós-cadastro
    E avançou até uma etapa intermediária
    Quando fechar o aplicativo durante o pós-cadastro
    E acessar novamente sua conta
    Então o sistema deve retomar o fluxo na última etapa salva
    E deve manter as informações já preenchidas
