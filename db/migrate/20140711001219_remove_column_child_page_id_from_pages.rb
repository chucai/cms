class RemoveColumnChildPageIdFromPages < ActiveRecord::Migration
  def up
    remove_column :pages, :child_page_id
  end

  def down
    add_column :pages, :child_page_id, :integer
  end
end
