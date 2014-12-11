class WikiPolicy < ApplicationPolicy
  
  def can_add_collaborators?
    destroy? && (@user.role == 'premium' || 'admin')
  end
  
  class Scope
    attr_reader :user, :scope
    
    def initialize(user, scope)
      @user = user
      @scope = scope
    end
    
    def resolve
      wikis = []
      all_wikis = scope.all
      if user.role == 'admin'
        all_wikis
      elsif user.role == 'premium'
        all_wikis.each do |wiki|
          if !wiki.private? || wiki.user == user || wiki.users.include?(user)
            wikis << wiki
          end
        end
      else
        all_wikis.each do |wiki|
          if !wiki.private? || wiki.users.include?(user)
            wikis << wiki
          end
        end
      end
      wikis
    end
  end
end