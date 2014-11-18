class CreateWikis < ActiveRecord::Migration
  def change
    create_table :wikis do |t|
      t.integer :user_id
      t.string :name

      t.timestamps
    end
  end
end
