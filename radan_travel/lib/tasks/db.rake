#encoding: utf-8
namespace :db do


  desc "creates default users"
  task :create_default_users => :environment do
    User.create(user_name:"admin", password:"123qwe123", email:"mahsa.poorjafari@gmail.com") if User.where(user_name:"admin").blank?
    p 'user create'
  end

end

