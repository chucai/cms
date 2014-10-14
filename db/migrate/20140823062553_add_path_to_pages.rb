class AddPathToPages < ActiveRecord::Migration
  def change
    add_column :pages, :path, :string, :default => ''
  end
end
