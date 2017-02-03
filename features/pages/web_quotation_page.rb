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

    case type
      when "Ano Modelo"
        case value
          when "2012"
            find('#auto_order_flow_pricing_requirements_vehicle_attributes_year').find(:xpath, 'option[7]').select_option
            assert_selector('#auto_order_flow_pricing_requirements_vehicle_attributes_version')
        end
    end

    case type
      when "Versão"
        case value
          when "FIT DX 1.4 FLEX 16V 5P MEC. (Gasolina / Flex)"
            find('#auto_order_flow_pricing_requirements_vehicle_attributes_version').find(:xpath, 'option[3]').select_option
        end
    end
  end
end