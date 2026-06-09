import { Given, When, Then } from "cypress-cucumber-preprocessor/steps"

let emailDinamico

Given("que a pessoa usuária esteja na página de login", () => {
  cy.viewport(390, 844)
  cy.visit("https://paciente-staging.lacreisaude.com.br/")
  cy.url().should("include", "lacreisaude")
})


When("clicar no link {string}", (link) => {
  cy.contains(link)
    .should("be.visible")
    .click()
})

Then("a pessoa usuária deve ser redirecionada para a página de cadastro", () => {
  cy.url({ timeout: 15000 })
    .should("include", "cadastrar")
})

When("preencher o campo nome com {string}", (nome) => {
  cy.get('#firstName')
    .should('be.visible')
    .clear()
    .type(nome)
})

When("preencher o campo sobrenome com {string}", (sobrenome) => {
  cy.get('#lastName')
    .should('be.visible')
    .clear()
    .type(sobrenome)
})

When("preencher o campo email com {string}", (_email) => {
  emailDinamico = `qa${Date.now()}@teste.com`

  cy.get('#email')
    .should('be.visible')
    .clear()
    .type(emailDinamico)

  cy.get('#email2')
    .should('be.visible')
    .clear()
    .type(emailDinamico)

  cy.get('#email, #email2')
    .each(($el) => {
      cy.wrap($el).should('have.value', emailDinamico)
    })
})

When("preencher o campo senha com {string}", (senha) => {
  cy.get('#password1')
    .should('be.visible')
    .clear()
    .type(senha)

  cy.get('#password2')
    .should('be.visible')
    .clear()
    .type(senha)
})

When("aceitar os termos de uso", () => {
  cy.get('input[type="checkbox"]').first()
    .should('be.visible')
    .and('not.be.checked')
    .and('not.be.disabled')
    .click()
    .should('be.checked')
})


When("confirmar a idade mínima", () => {
  cy.get('input[type="checkbox"]').eq(1)
    .should('be.visible')
    .and('not.be.checked')
    .and('not.be.disabled')
    .click()
    .should('be.checked')
})

When("clicar no botão {string}", (botao) => {
  cy.contains('button', botao)
    .should('be.visible')
    .and('not.be.disabled')
    .click()
})

Then('é redirecionado para a página de verificação de e-mail', () => {
  cy.url().should('include', '/verificar-email')

  cy.contains('Estamos quase lá...')
    .should('be.visible')
})