import { Given, When, Then } from "cypress-cucumber-preprocessor/steps"

Given("que a pessoa usuária esteja na tela de login", () => {   
    cy.visit("https://paciente-staging.lacreisaude.com.br/")
})

When("digitar o email {string}", (email) => {
    cy.get('#email').type(email)
})
  
When("digitar a senha {string}", (senha) => {
    cy.get('#password').type(senha)
})

When("clicar no botão {string}", (botao) => {
    cy.contains(botao).click()
})      

Then("o sistema deve redirecionar para a próxima página", () => {
    cy.url().should("not.include", "login")
})