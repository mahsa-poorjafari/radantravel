#encoding: utf-8
namespace :db do  
  desc "add_default_roles"
  task :add_default_roles => :environment do
    Role.create(title:"Admin") if Role.where(title:"Admin").blank?
    Role.create(title:"Users") if Role.where(title:"Users").blank?
    p 'Roles create'
  end  

end

