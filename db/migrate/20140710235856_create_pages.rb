class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.integer :id
      t.integer :parent_page_id, :default => nil
      t.integer :child_page_id, :default => nil
      t.string :title, :default => nil
      t.string :description, :default => nil
      t.integer :style_id, :default => 1

      t.timestamps
    end
  end
end
