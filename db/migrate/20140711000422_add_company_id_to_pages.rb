class AddCompanyIdToPages < ActiveRecord::Migration
  def change
    add_column :pages, :company_id, :integer, :allow_nil => false 
  end
end
