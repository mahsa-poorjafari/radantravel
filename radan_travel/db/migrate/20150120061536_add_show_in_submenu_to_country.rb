class AddShowInSubmenuToCountry < ActiveRecord::Migration
  def change
    add_column :countries, :show_in_submenu, :boolean,         default: false
  end
end
