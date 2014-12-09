class UsersController < ApplicationController
  
  def show
    @user = current_user
    @wikis = policy_scope(Wiki)
  end
  
  def update
  end
  
end
