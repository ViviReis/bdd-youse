Feature: Quotation

  @quotation
  Scenario: User logged in Youse website should be able to logout
    Given I am on Youse
      And I am logged in Youse's website
      And I click on "Cotar Seguro Auto"
     When I fill in "Telefone" with "11999999999"
     Then I should see "Próximo Passo"
     When I click on "Próximo Passo"
     Then I should see "Agora, fale um pouquinho sobre o seu carro."
     When I select "HONDA" in "Marca do Carro"
      And I select "FIT" in "Modelo do Carro"
      And I select "Ano Modelo" in "2012"
      And I select "Versão" in "FIT DX 1.4 FLEX 16V 5P MEC. (Gasolina / Flex)"

