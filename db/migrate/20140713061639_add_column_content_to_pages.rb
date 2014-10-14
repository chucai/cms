class AddColumnContentToPages < ActiveRecord::Migration
  def change
    add_column :pages, :content, :text, :default => ''
  end
end
