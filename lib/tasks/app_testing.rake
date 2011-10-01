namespace :app do
  desc "Create an admin account for testing"
  task :create_testing_user => :environment do
    User.create!(:username=>"admin", :email => "michael@mwdesilva.com", :password=>"pass123", :password_confirmation=>"pass123", :name=>"Michael")
  end
end