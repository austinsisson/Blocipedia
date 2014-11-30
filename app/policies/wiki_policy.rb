class WikiPolicy < ApplicationPolicy
  
  def index?
    user.present? && (record.user == user || user.admin?)
  end
end