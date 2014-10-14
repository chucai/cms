class AddTitleToUImages < ActiveRecord::Migration
  def change
    add_column :u_images, :title, :string, :default => ''
  end
end
