class UsersController < ApplicationController
  
  def show
    @user = current_user
    @wikis = Wiki.all
  end
  
  def update
  end
end
