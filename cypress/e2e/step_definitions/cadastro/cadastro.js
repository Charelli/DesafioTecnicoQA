import { Given, When, Then } from "cypress-cucumber-preprocessor/steps"

Given("que a pessoa usuária esteja na página de login", () => {
  cy.viewport(390, 844)
  cy.visit("https://paciente-staging.lacreisaude.com.br/")
})

When("clicar no link {string}", () => {
  cy.get('.kBHbgx > .sc-kMribo')
    .scrollIntoView()
    .click({ force: true })
})

Then("a pessoa usuária deve ser redirecionada para a página de cadastro", () => {
  cy.url().should("include", "cadastrar")
})

When("preencher o campo nome com {string}", (nome) => {
  cy.get('#firstName')
    .scrollIntoView()
    .should('be.visible')
    .type(nome)
})

When("preencher o campo sobrenome com {string}", (sobrenome) => {
  cy.get('#lastName')
    .scrollIntoView()
    .should('be.visible')
    .type(sobrenome)
})

When("preencher o campo email com {string}", () => {
  const emailDinamico = `qa${Date.now()}@teste.com`

  cy.get('#email')
    .scrollIntoView()
    .should('be.visible')
    .type(emailDinamico)

  cy.get('#email2')
    .scrollIntoView()
    .should('be.visible')
    .type(emailDinamico)

  cy.get('#email').should('have.value', emailDinamico)
  cy.get('#email2').should('have.value', emailDinamico)
})

When("preencher o campo senha com {string}", (senha) => {
  cy.get('#password1')
    .scrollIntoView()
    .should('be.visible')
    .type(senha)

  cy.get('#password2')
    .scrollIntoView()
    .should('be.visible')
    .type(senha)
})

When("aceitar os termos de uso", () => {
  cy.get('input[type="checkbox"]')
    .first()
    .scrollIntoView()
    .check({ force: true })
})

When("confirmar a idade mínima", () => {
  cy.get('input[type="checkbox"]')
    .eq(1)
    .scrollIntoView()
    .check({ force: true })
})

When("clicar no botão {string}", (botao) => {
  cy.contains(botao)
    .scrollIntoView()
    .click({ force: true })
})

Then("o sistema deve criar uma nova conta", () => {
  cy.contains("Enviamos um link",{timeout: 10000 })
    .should("be.visible")
})