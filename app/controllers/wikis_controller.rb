class WikisController < ApplicationController
  def index
  end
  
  def create
  end

  def new
    @wiki = current_user.wikis.build
  end
  

  def destroy
  end

  def edit
  end

  def show
  end
end
