Feature: Quotation

  @quotation
  Scenario Outline: User registration in Youse website should be able to make an insurance quote
    Given I am on Youse
      And I am logged in Youse's website
      And I click on "Cotar Seguro Auto"
     When I fill in "Telefone" with "11999999999"
     Then I should see "Próximo Passo"
     When I click on "Próximo Passo"
     Then I should see "Agora, fale um pouquinho sobre o seu carro."
     When I select "HONDA" in "Marca do Carro"
      And I select "FIT" in "Modelo do Carro"
      And I select "2012"
      And I select "FIT DX 1.4 FLEX 16V 5P MEC. (Gasolina / Flex)"
      And I fill in "CEP" with "05001100"
      And I select "<sexo>"
      And I fill in "Data de Nascimento" with "<birth>"
      And I select "solteiro(a)"
      And I select "Não desejo"
      And I select "nunca tive"
     Then I should see message "Maravilha, chegou a hora de deixar o seguro do jeito que você quer."
      And I should see "Próximo Passo"
     When I click on "Próximo Passo"
     Then I should see message "Essa é a parte mais legal: bora deixar o seguro com a sua cara?"
     When I click on "Próximo Passo"
     Then I should see message "Sugestões de Assistências Youse para vc."
     When I click on "Próximo Passo"
     Then I should see message "Aeee! Estamos quase lá. Conta aí um pouquinho mais sobre vc"
     When I fill in "Nome completo" with "<name>"
      And I fill in "CPF" with "<cpf>"
      And I fill in "Trabalho como" with "Adm"
      And I select "Acima de R$ 7.000,00"
      And I fill in "número" with "110"
      And I click on "Próximo Passo"
     Then I should see message "Estamos cada vez mais perto de fechar seu seguro :D"
     When I fill in "Placa" with "CTL-9151"
      And I select "não é blindado"
     Then I should see message "Pronto! Um seguro do seu jeito."
     When I click on "Próximo Passo"
     Then I should see message "<message>"


    Examples:
      |sexo     | birth  | name                             |cpf        |message                                      |
      |masculino|14051996| Bruno Nogueira Bueno Spadafora   |42945169843|Para finalizar, insira os dados de pagamento.|
      |feminino |01111973| Ana Maria Eunice Machado da Silva|77568893120|Poxa! seu seguro não foi aceito!             |


