class UsersController < ApplicationController
  
  def show
    @user = current_user
    @wikis = @user.wikis
  end
  
  def update
  end
end
