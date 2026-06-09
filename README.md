# 🧪 Lacrei Saúde — Testes Funcionais (Versão Mobile)

Projeto de QA desenvolvido como parte do desafio prático do programa de mentoria com foco em testes manuais, automação, acessibilidade, desempenho e responsividade da plataforma **Lacrei Saúde**.

---

## 📁 Estrutura do Repositório

```text
📦 DESAFIOQALACREI
 ┣ 📂 .github/
 ┃ ┗ 📂 workflows/
 ┃   ┗ ci.yml                        # Pipeline CI/CD — GitHub Actions
 ┣ 📂 cypress/
 ┃ ┗ 📂 e2e/
 ┃   ┗ 📂 step_definitions/
 ┃     ┣ 📂 cadastro/
 ┃     ┃ ┗ cadastros.js              # Step definitions — cadastro
 ┃   ┣ cadastro.feature              # Cenários automatizados — cadastro
 ┃   ┗ login.feature                 # Cenários automatizados — login
 ┣ 📂 Performance-k6/
 ┃ ┗ busca-profissional.js           # Teste de carga com k6
 ┣ 📂 test-manual/
 ┃ ┣ 01-cadastro-de-usuario.feature
 ┃ ┣ 02-pos-cadastro-de-usuario.feature
 ┃ ┣ 03-recuperar-senha.feature
 ┃ ┣ 04-busca-de-profissional.feature
 ┃ ┗ 05-contatar-profissional.feature
 ┣ cypress.config.js
 ┣ package.json
 ┗ README.md
```

---

## ⚙️ Como Configurar o Ambiente

### Pré-requisitos

* Node.js >= 18
* npm >= 9

```bash
git clone https://github.com/Charelli/DesafioTecnicoQA.git
cd DesafioTecnicoQA
npm install
```

---

## ▶️ Como Executar os Testes

### Testes Manuais

Acesse os arquivos `.feature` na pasta `/test-manual` e execute os cenários manualmente no navegador com DevTools aberto (modo iPhone 12 Pro — 390x844).

### Testes Automatizados (Cypress + Cucumber)

```bash
# Interface visual
npx cypress open

# Modo headless (CI)
npx cypress run
```

---

## 🤖 CI/CD — GitHub Actions

A cada `push` ou `pull request`, os testes rodam automaticamente via GitHub Actions.

Os relatórios ficam disponíveis como artefatos no próprio workflow.

Pipeline configurado em:

```text
.github/workflows/ci.yml
```

---

## ✅ Fluxos Testados

| Fluxo                 | Arquivo                              | Técnicas Utilizadas                              |
| --------------------- | ------------------------------------ | ------------------------------------------------ |
| Cadastro de usuária   | `01-cadastro-de-usuario.feature`     | Partição de equivalência, BVA, tabela de decisão |
| Pós-cadastro          | `02-pos-cadastro-de-usuario.feature` | Teste exploratório                               |
| Recuperação de senha  | `03-recuperar-senha.feature`         | Fluxo completo — caminho feliz e alternativos    |
| Busca de profissional | `04-busca-de-profissional.feature`   | Teste exploratório                               |
| Contatar profissional | `05-contatar-profissional.feature`   | Teste exploratório                               |

---

## 🐛 Bugs Encontrados

Registrados no Notion e nas Issues do GitHub, contendo:

* Descrição detalhada
* Passos para reprodução
* Print/evidência
* Classificação de impacto
* Sugestões de melhoria

### Exemplos identificados

| #  | Título                                                                       | Impacto |
| -- | ---------------------------------------------------------------------------- | ------- |
| 01 | Botão "Agendar consulta" não exibe confirmação após agendamento bem-sucedido | Alto    |
| 02 | Campo de celular aceita número inválido (ex: 1111-1111)                      | Alto    |

---

## 🚀 Desempenho

### Frontend — Lighthouse

| Página                 | Score     | Prioridade |
| ---------------------- | --------- | ---------- |
| Login                  | 🔴 33/100 | Alta       |
| Busca de Profissionais | 🔴 34/100 | Alta       |
| Cadastro               | 🔴 38/100 | Alta       |

> Todas as páginas ficaram abaixo do mínimo recomendado (90). Principais impactos: tempo de carregamento, tamanho de assets e ausência de cache eficiente.

### Carga de API — k6

| Cenário                                                          | Resultado                                                    | Prioridade |
| ---------------------------------------------------------------- | ------------------------------------------------------------ | ---------- |
| Busca de Profissionais (30 usuários simultâneos por 30 segundos) | 🔴 Alta taxa de falhas identificada durante o teste de carga | Crítico    |

> Resultado detalhado disponível na documentação do Notion.

---

## ♿ Acessibilidade

Validações realizadas com **DevTools + Lighthouse**:

* [x] Verificação de contraste de cores
* [x] Legibilidade em mobile
* [x] Navegação via teclado

---

## 📱 Responsividade

| Dispositivo   | Resolução | Status    |
| ------------- | --------- | --------- |
| iPhone 12 Pro | 390 x 844 | ✅ Testado |
| Desktop       | > 1024px  | ✅ Testado |

### Validações realizadas

* [x] Layout adaptado para diferentes resoluções
* [x] Funcionalidades operando corretamente em mobile e desktop
* [x] Usabilidade preservada durante a navegação

---

## 🔒 Checklist de Segurança

Validações realizadas durante os testes:

* [x] Campos obrigatórios impedem envio de formulários vazios
* [x] Validação de formato de e-mail
* [x] Senhas mascaradas durante a digitação
* [x] Comunicação realizada via HTTPS
* [x] Mensagens de erro sem exposição de informações sensíveis

---

## 🔄 Processo de Rollback

Em caso de falha em testes automatizados após alterações:

1. Identificar o commit responsável pela falha.
2. Reverter o commit ou corrigir a alteração.
3. Executar novamente os testes localmente.
4. Validar a execução do pipeline CI/CD.
5. Realizar novo merge somente após estabilização dos testes.

---

## 📄 Documentação Completa no Notion

🔗 Acesse a documentação completa: 

https://foamy-squid-98b.notion.site/Desafio-QA-Lacrei-Sa-de-377dead24a9680e8b338fb4f16fbeb31?source=copy_link

---

## 👩‍💻 Autora

**Lays Charelli Domingos**
Analista de Qualidade de Software (QA) em transição de carreira, com foco em testes manuais, automação, acessibilidade, desempenho e qualidade de software.

