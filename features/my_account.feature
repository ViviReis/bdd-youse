Feature: My Account

  @myAccount
  Scenario: New user should be able to register in Youse website
    Given I am on Youse
      And I click on "Minha Conta"
      And I click on "Cadastre-se"
     When I fill in "Nome" field
      And I fill in "Email" field
      And I fill in "Senha" field
      And I fill in "Confirme sua senha" field
      And I click on "Enviar Cadastro"
     Then I should see message "Bem vindo! Você realizou seu registro com sucesso."
      And I should see message "Ops, você ainda não tem nenhum seguro Youse. =("

  @myAccount
  Scenario: User already registered in the Youse website should be able to login
    Given I am on Youse
      And I click on "Minha Conta"
     When I fill in "E-mail"
      And I click on "Próximo Passo"
      And I fill in "Senha"
      And I click on "Entrar"
     Then I should see message "Login efetuado com sucesso."

  @myAccount
  Scenario: User logged in Youse website should be able to logout
    Given I am on Youse
      And I am logged in Youse's website
     When I put mouse over "Logout Header"
      And I click on "Sair"
     Then I should see message "Olá, somos a Youse"
