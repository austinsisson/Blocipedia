class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  
  has_many :wikis
  has_many :collaborators, through: :wikis
  
  def admin?
    role == 'admin'
  end
  
  def standard?
    role == 'standard'
  end
  
  def premium?
    role == 'premium'
  end
end
