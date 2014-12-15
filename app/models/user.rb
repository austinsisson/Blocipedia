class User < ActiveRecord::Base
  include Pundit
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  
  has_many :wikis
  has_many :collaborators
  has_many :wiki_collaborations, through: :collaborators, source: :wiki

  ROLES = %w(admin standard premium)

  ROLES.each do |user_role|
    define_method "#{user_role}?" do
      role == "#{user_role}"
    end
  end
  
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
