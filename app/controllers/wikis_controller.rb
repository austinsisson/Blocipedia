class WikisController < ApplicationController
  def index
    @user = current_user
    @user.wikis
  end
  
  def create
    @user = current_user
    @wiki = @user.wikis.new(wiki_params)
    
    if @wiki.save
      flash[:alert] = "Wiki saved succesfully!"
    else
      flash[:error] = "An error occurred, please try again."
    end
    
    redirect_to @user
  end

  def destroy
  end

  def edit
  end

  def show
  end
  
  private
  
  def wiki_params
    params.require(:wiki).permit(:name, :content, :private)
  end
end
