class WikisController < ApplicationController
  def index
  end
  
  def create
    @wiki = current_user.wikis.build(wiki_params)
    @wiki.save
    redirect_to user_path(current_user)
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

  private

  def wiki_params
    params.require(:wiki).permit(:name, :content, :user_id)
  end
  
end
