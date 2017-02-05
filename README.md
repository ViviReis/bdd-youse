-----------------------
##1 - Install Ruby Version Manager (RVM)##
    $ gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
    $ curl -sSL https://get.rvm.io | bash -s stable

-----------------------
##2 - Clone project##
    cd <your projects path>
    git clone https://github.com/ViviReis/bdd-youse.git

-----------------------
##3 - Install dependencies##
###3.1 - copy the settings of dependencias of the file settings Gemfile.lock to Gemfile
###3.2 - gem bundler install
###3.3 - bundle install

-----------------------
##4 - Run tests##

###4.1 - run all tests
    $ cucumber

###4.2 - run tests My Account
    $ cucumber --tag @myAccount
   
###4.3 - run tests Quotation
    $ cucumber --tag @quotation
    
-----------------------
##5 - See the tests report in you browser
    <your bdd project path>/report/report.html
-----------------------

##6 - See the tests evidences
    <your bdd project path>/report/evidences
-----------------------
