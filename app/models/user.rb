class User < ActiveRecord::Base
  include Pundit
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  
  has_many :wikis
  has_many :collaborators
  has_many :wiki_collaborations, through: :collaborators, source: :wiki
  
  scope :can_add_collaborators, -> { where(policy(@wiki).destroy? && (current_user.role == 'premium' || 'admin') && @wiki.user == @user)}
  
  #def can_add_collaborators?
    #policy(@wiki).destroy? && (current_user.role == 'premium' || 'admin') && @wiki.user == @user
  #end
  
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
