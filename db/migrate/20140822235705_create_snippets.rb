class CreateSnippets < ActiveRecord::Migration
  def change
    create_table :snippets do |t|
      t.string :name
      t.string :description
      t.text :context
      t.string :stype

      t.timestamps
    end
  end
end
