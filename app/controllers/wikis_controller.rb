class WikisController < ApplicationController
  def index
    @user = current_user
    @wikis = @user.wikis.all
    authorize @wikis
  end
  
  def create
    @user = current_user
    @wiki = @user.wikis.new(wiki_params)
    authorize @wiki
    
    if @wiki.save
      flash[:alert] = "Wiki saved succesfully!"
    else
      flash[:error] = "An error occurred, please try again."
    end
    
    redirect_to @user
  end

  def destroy
    @user = current_user
    @wiki = @user.wikis.find(params[:id])
    authorize @wiki
    
    if @wiki.destroy
      flash[:alert] = "Wiki was deleted succesfully!"
    else
      flash[:error] = "An error occurred, please try again."
    end
    
    redirect_to @user
  end

  def edit
    @user = current_user
    @wiki = @user.wikis.find(params[:id])
  end

  def update
    @user = current_user
    @wiki = @user.wikis.find(params[:id])
    authorize @wiki
    
    if @wiki.update_attributes(wiki_params)
      flash[:alert] = "Wiki was updated to reflect changes."
    else
      flash[:error] = "An error occurred, please try again."
    end
    
    redirect_to [@user, @wiki]
  end
  
  def show
    @user = current_user
    @wiki = @user.wikis.find(params[:id])
  end
  
  private
  
  def wiki_params
    params.require(:wiki).permit(:name, :content, :private)
  end
end
