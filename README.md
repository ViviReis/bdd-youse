-----------------------
##1 - Install Ruby Version Manager (RVM)##
    $ gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
    $ curl -sSL https://get.rvm.io | bash -s stable

-----------------------
##2 - Install Selenium Standalone and ChromeWebDriver
    cd <your bdd project path>/scripts
    ./install.sh

-----------------------
##3 - Clone project##
    cd <your projects path>
    git clone https://github.com/ViviReis/bdd-youse.git

-----------------------
##4 - Install dependencies##
###4.1 - copy the settings of dependencias of the file settings Gemfile.lock to Gemfile
###4.2 - gem bundler install
###4.3 - bundle install

-----------------------
##5 - Run tests##

###5.1 - run all tests
    $ cucumber

###5.2 - run tests My Account
    $ cucumber --tag @myAccount
   
###5.2 - run tests Quotation
    $ cucumber --tag @quotation

##6 - See the tests report in you browser
    <your bdd project path>/report/report.html
-----------------------
