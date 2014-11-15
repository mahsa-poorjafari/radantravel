#encoding: utf-8
namespace :db do  
  desc "add_default_roles"
  task :add_default_roles => :environment do
    Role.create(title:"Admin") if Role.where(title:"Admin").blank?
    Role.create(title:"Users") if Role.where(title:"Users").blank?
    p 'Roles create'
  end  
  desc "creates default pages -> about us and contact us"
  task :add_default_pages => :environment do
    Page.create(:title_fa => "درباره ما", :title_en => "About us", :title_ar => "من نحن" ) if Page.where(title_fa:"درباره ما").blank?
    Page.create(:title_fa => "تماس با ما", :title_en => "Contact us", :title_ar => "الاتصال بنا") if Page.where(title_fa:"تماس با ما").blank?
    p "#{Page.count} pages created"
  end

end

