class AddContentToWikis < ActiveRecord::Migration
  def change
    add_column :wikis, :content, :text
  end
end
