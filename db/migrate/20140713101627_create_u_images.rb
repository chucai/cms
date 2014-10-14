class CreateUImages < ActiveRecord::Migration
  def change
    create_table :u_images do |t|
      t.string :upfile
      t.datetime :deleted_at, :default => nil

      t.timestamps
    end
  end
end
