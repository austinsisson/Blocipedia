class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborators
  has_many :users, through: :collaborators
  
  def clear_collaborators
    self.update(user_ids: [])
    self.save
  end
end
