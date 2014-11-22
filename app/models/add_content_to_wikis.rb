class AddContentToWikis < ActiveRecord::Base
  add_column :wikis, :content, :string
end
