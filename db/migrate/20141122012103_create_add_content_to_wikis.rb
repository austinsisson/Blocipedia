class CreateAddContentToWikis < ActiveRecord::Migration
  def change
    create_table :add_content_to_wikis do |t|
      t.text :content

      t.timestamps
    end
  end
end
