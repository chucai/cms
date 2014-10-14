class AddColumnUrlToPages < ActiveRecord::Migration
  def change
    add_column :pages, :url, :string, :allow_nil => false
  end
end
