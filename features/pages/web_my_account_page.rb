#encoding: utf-8
require 'yaml'
require 'csv'
require 'randomstring'

class WebMyAccountPage

  include Capybara::DSL

  def initialize()
    @env = YAML::load_file(File.join(File.dirname('config/..'), 'env.yml'))
    @uri_youse_web = @env['url_youse_web']
    @random_user = Randomstring.generate(15)
    @random_pass = Randomstring.generate(10)
  end

  def home()
    visit(@uri_youse_web)
    assert_text('Olá, somos a Youse')
  end

  def mouseover(over)
    case over
      when "Logout Header"
        find(:css,'a.account-header__account-link.account-header__account-with-sub-menu').hover
    end
  end

  def click(button)
    case button
      when "Minha Conta"
        find(:link, 'MINHA CONTA').click
        assert_text('Para continuar, faça login ou registre-se.')
      when "Cadastre-se"
        find(:link, 'Cadastre-se').click
        assert_text('Cadastre-se para ser um Youser')
      when "Enviar Cadastro"
        find(:css,'input[name="commit"]').click
      when "Próximo Passo"
        find(:css,'input[name="commit"]').click
      when "Entrar"
        find(:css,'input[name="commit"]').click
      when "Sair"
        find('#track_logout').click
      when "Cotar Seguro Auto"
        find(:link, 'COTAR SEGURO AUTO').click
        sleep (1)
        assert_text('Oi, a gente quer conhecer você melhor, é rapidinho')
    end
  end

  def read_csv()
    CSV.foreach('CSV/user.csv') do |row|
      @user = row[0]
      @password = row[1]
    end
  end

  def register(field)
    @email = @random_user + '@teste.com.br'
    @pass = @random_pass
    CSV.open('CSV/user.csv', 'wb') do |csv|
      csv << [@email,@pass]
    end
    case field
      when "Email"
        find('#user_email').set(@email)
      when "Senha"
        find('#user_password').set(@pass)
      when "Confirme sua senha"
        find('#user_password_confirmation').set(@pass)
    end
  end

  def login(field)
    CSV.foreach('CSV/user.csv') do |row|
      @user = row[0]
      @password = row[1]
    end
    case field
      when "E-mail"
        find('#email').set(@user)
      when "Senha"
        find('#user_password').set(@password)
    end
  end

  def logged()
    CSV.foreach('CSV/user.csv') do |row|
      @user = row[0]
      @password = row[1]
    end
    find(:link, 'MINHA CONTA').click
    assert_text('Para continuar, faça login ou registre-se.')
    find('#email').set(@user)
    find(:css,'input[name="commit"]').click
    find('#user_password').set(@password)
    find(:css,'input[name="commit"]').click
    assert_text('Login efetuado com sucesso.')
  end
end