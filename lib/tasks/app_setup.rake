namespace :app do
  desc "Seed data into db for demonstration"
  task :setup_seed_data => :environment do
    ["russel@google.com", "john@doe.net", "bob@parsons.com"].each { |r|  Customer.create(:email => "#{r}") }
    ["Wall-Mart", "McDonalds"].each { |r|  OfflinePartner.create(:name => "#{r}") }     
    %w[Paypal Google].each { |r|  OnlineShop.create(:name => "#{r}") } 
  end
end