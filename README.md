# 🧪 Lacrei Saúde — Testes Funcionais (Versão Mobile)

Projeto de Quality Assurance (QA) desenvolvido como parte de um desafio prático, com foco em testes funcionais, automação, performance, acessibilidade e responsividade da plataforma **Lacrei Saúde**.

O objetivo é simular um fluxo real de qualidade de software em ambiente próximo à produção, cobrindo diferentes níveis de teste.

---

## 📁 Estrutura do Repositório

```
📦 DESAFIOQALACREI
 ┣ 📂 .github/
 ┃ ┗ 📂 workflows/
 ┃   ┗ ci.yml                        # Pipeline CI/CD — GitHub Actions
 ┣ 📂 cypress/
 ┃ ┗ 📂 e2e/
 ┃   ┗ 📂 step_definitions/
 ┃     ┣ 📂 cadastro/
 ┃     ┃ ┗ cadastros.js              # Step definitions — cadastro
 ┃     ┗ 📂 login/
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

**Pré-requisitos:**
- Node.js >= 18
- npm >= 9

```bash
git clone https://github.com/Charelli/DesafioTecnicoQA.git
cd DesafioTecnicoQA
npm install
```

---

## ▶️ Como Executar os Testes

**Testes manuais:**
Acesse os arquivos `.feature` na pasta `/test-manual` e execute os cenários manualmente no navegador com DevTools aberto (modo iPhone 12 Pro — 390x844).

**Testes automatizados (Cypress + Cucumber):**
```bash
# Interface visual
npx cypress open

# Modo headless (CI)
npx cypress run
```

---

## 🤖 CI/CD — GitHub Actions

A cada `push` ou `pull request`, os testes rodam automaticamente via GitHub Actions. Os relatórios ficam disponíveis como artefatos no próprio workflow.

Pipeline configurado em: `.github/workflows/ci.yml`

---

## ✅ Fluxos Testados

| Fluxo | Arquivo | Técnicas Utilizadas |
|---|---|---|
| Cadastro de usuária | `01-cadastro-de-usuario.feature` | Partição de equivalência, BVA, tabela de decisão |
| Pós-cadastro | `02-pos-cadastro-de-usuario.feature` | Teste exploratório |
| Recuperação de senha | `03-recuperar-senha.feature` | Fluxo completo — caminho feliz e alternativos |
| Busca de profissional | `04-busca-de-profissional.feature` | Teste exploratório |
| Contatar profissional | `05-contatar-profissional.feature` | Teste exploratório |

---

## 🐛 Bugs Encontrados

Registrados no Notion, contendo:
- Descrição detalhada
- Passos para reprodução
- Print/evidência
- Classificação de impacto

**Exemplos identificados:**

| # | Título | Impacto |
|---|---|---|
| 01 | Botão "Agendar consulta" não exibe confirmação após agendamento bem-sucedido | Alto |
| 02 | Campo de celular aceita número inválido (ex: 1111-1111) | Alto |

---

## 🚀 Desempenho

### Frontend — Lighthouse

| Página | Score | Prioridade |
|---|---|---|
| Login | 🔴 33/100 | Alta |
| Busca de Profissionais | 🔴 34/100 | Alta |
| Cadastro | 🔴 38/100 | Alta |

> Todas as páginas ficaram abaixo do mínimo recomendado (90). Principais impactos: tempo de carregamento, tamanho de assets e ausência de cache eficiente.

### Carga de API — k6

| Cenário | Resultado | Prioridade |
|---|---|---|
| Busca de Profissionais (30 usuários simultâneos) | 🔴 68% de falha | Crítico |

> Script de carga em `/Performance-k6/busca-profissional.js`

---

## ♿ Acessibilidade

Validações realizadas com **DevTools + Lighthouse**:

- [x] Contraste de cores — nota ≥ 90
- [x] Legibilidade em mobile
- [x] Navegação via teclado

---

## 📱 Responsividade

| Dispositivo | Resolução | Status |
|---|---|---|
| iPhone 12 Pro | 390 x 844 | ✅ Testado |
| Desktop | > 1024px | ✅ Testado |

---

## 📄 Documentação Completa no Notion

🔗 [Acesse aqui](https://foamy-squid-98b.notion.site/Desafio-QA-Lacrei-Sa-de-377dead24a9680e8b338fb4f16fbeb31?source=copy_link)

---

## 👩‍💻 Autora

**Lays** — QA em transição de carreira, aprendendo diariamente com novas ferramentas e desafios.


