#encoding: utf-8

require 'randomstring'

class WebQuotationPage

  include Capybara::DSL

  def initialize()
    @random_user = Randomstring.generate(15)
    @random_pass = Randomstring.generate(10)
  end

  def fill(field,value)
    case field
      when "Telefone"
        find('#auto_order_flow_lead_person_data_lead_person_attributes_phone').set(value)

      when "Nome"
        find('#user_name').set('value')

      when "CEP"
        find('#auto_order_flow_pricing_requirements_vehicle_attributes_address_attributes_zipcode').set(value)
        assert_selector('#auto_order_flow_pricing_requirements_insured_person_attributes_gender')

      when "Data de Nascimento"
        find('#auto_order_flow_pricing_requirements_insured_person_attributes_date_of_birth').set(value)
        assert_selector('#auto_order_flow_pricing_requirements_insured_person_attributes_marital_status')

      when "Nome completo"
        find('#auto_order_flow_insured_person_data_insured_person_attributes_name').set(value)

      when "CPF"
        find('#auto_order_flow_insured_person_data_insured_person_attributes_cpf').set(value)
        assert_selector('#select2-auto_order_flow_insured_person_data_insured_person_attributes_occupation-container')

      when "Trabalho como"
        find('#select2-auto_order_flow_insured_person_data_insured_person_attributes_occupation-container').click
        find(:css, 'input.select2-search__field').set(value)
        find(:css, 'input.select2-search__field').native.send_keys(:enter)
        assert_selector('#auto_order_flow_insured_person_data_insured_person_attributes_salary_range')

      when "número"
        find('#auto_order_flow_insured_person_data_insured_person_attributes_address_attributes_number').set(value)

      when "Placa"
        find('#auto_order_flow_vehicle_data_vehicle_attributes_license_plate').set(value)
        assert_selector('#adapted')

      when "Email"
        find('#email').set(value)

      when "Senha"
        find('#user_password').set(value)
    end
  end

  def message(alert)
    @alert = nil
    case alert
      when "Póximo Passo"
        assert_selector(:css, 'input[name="commit"]')
    end
  end

  def option(value,type)
    case type
      when "Marca do Carro"

        case value
          when "HONDA"

            find('#auto_order_flow_pricing_requirements_vehicle_attributes_make').find(:xpath, 'option[5]').select_option
            assert_selector('#auto_order_flow_pricing_requirements_vehicle_attributes_model')
        end
    end

    case type
      when "Modelo do Carro"

        case value
          when "FIT"

            find('#auto_order_flow_pricing_requirements_vehicle_attributes_model').find(:xpath, 'option[6]').select_option
            assert_selector('#auto_order_flow_pricing_requirements_vehicle_attributes_year')
        end
    end
  end

  def type (value)
    case value
      when "2012"
        find('#auto_order_flow_pricing_requirements_vehicle_attributes_year').find(:xpath, 'option[7]').select_option
        assert_selector('#auto_order_flow_pricing_requirements_vehicle_attributes_version')

      when "FIT DX 1.4 FLEX 16V 5P MEC. (Gasolina / Flex)"
        find('#auto_order_flow_pricing_requirements_vehicle_attributes_version').find(:xpath, 'option[3]').select_option

      when "masculino"
        find('#auto_order_flow_pricing_requirements_insured_person_attributes_gender').find(:xpath, 'option[2]').select_option

      when "feminino"
        find('#auto_order_flow_pricing_requirements_insured_person_attributes_gender').find(:xpath, 'option[3]').select_option

      when "solteiro(a)"
        find('#auto_order_flow_pricing_requirements_insured_person_attributes_marital_status').find(:xpath, 'option[2]').select_option
        assert_selector('#auto_order_flow_pricing_requirements_driver_attributes_same_as_insured_person')

      when "Não desejo"
        find('#auto_order_flow_pricing_requirements_driver_attributes_young_driver').find(:xpath, 'option[3]').select_option
        assert_selector('#auto_order_flow_pricing_requirements_driver_attributes_years_since_last_claim')

      when "nunca tive"
        find('#auto_order_flow_pricing_requirements_driver_attributes_years_since_last_claim').find(:xpath, 'option[2]').select_option

      when "Acima de R$ 7.000,00"
        find('#auto_order_flow_insured_person_data_insured_person_attributes_salary_range').find(:xpath, 'option[6]').select_option
        assert_selector('#auto_order_flow_insured_person_data_insured_person_attributes_address_attributes_number')

      when "não é blindado"
        find('#auto_order_flow_vehicle_data_vehicle_attributes_bullet_proof').find(:xpath, 'option[2]').select_option
    end
  end
end