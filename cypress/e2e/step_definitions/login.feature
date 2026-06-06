
Feature: Login da pessoa usuária

Scenario: Realizar login com credenciais válidas
Given que a pessoa usuária esteja na tela de login
When digitar o email "charellilays@gmail.com"
And digitar a senha "Senha123!"
And clicar no botão "Entrar"
Then o sistema deve redirecionar para a próxima página