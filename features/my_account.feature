Feature: My Account

  @myAccount
  Scenario: New user should be able to register in Youse website
    Given I am on Youse
      And I click on "Minha Conta"
      And I click on "Cadastre-se"
     When I fill in "Nome" with "Bruno Nogueira Bueno Spadafora"
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

  @myAccount
  Scenario Outline: User shouldn't be able to access products with invalid login information
    Given I am on Youse
      And I click on "Minha Conta"
     When I fill in "Email" with "<username>"
      And I click on "Próximo Passo"
      And I fill in "Senha" with "<password>"
      And I click on "Entrar"
     Then I should see message "<message>"

    Examples:
      | username                   | password   |message                    |
      |KmveeKlusMqcPWH@teste.com.br| 123456879ed|Email ou senha inválidos.  |
      |blablablabla@blabla.com.br  | W8eYrmSl0n |Email ou senha inválidos.  |
      |KmveeKlusMqcPWH@teste.com.br|            |Email ou senha inválidos.  |
