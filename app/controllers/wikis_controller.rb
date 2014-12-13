class WikisController < ApplicationController
  def index
    @user = current_user
    @wikis = Wiki.all
    authorize @wikis
  end
  
  def new
    @user = current_user
    @wiki = Wiki.new
    authorize @wiki
  end
  
  def create
    @wiki = current_user.wikis.build(wiki_params)
    authorize @wiki
    
    if @wiki.save
      flash[:alert] = "Wiki saved succesfully!"
    else
      flash[:error] = "An error occurred, please try again."
    end
    
    redirect_to @wiki
  end

  def destroy
    @user = current_user
    @wiki = Wiki.friendly.find(params[:id])
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
    @wiki = Wiki.friendly.find(params[:id])
    authorize @wiki
  end

  def update
    @user = current_user
    @wiki = Wiki.friendly.find(params[:id])
    authorize @wiki
    
    
    if @wiki.update_attributes(wiki_params)
      remove_collaborators
      flash[:alert] = "Wiki was updated to reflect changes."
    else
      flash[:error] = "An error occurred, please try again."
    end
    
    redirect_to @wiki
  end
  
  def show
    @user = current_user
    @wiki = Wiki.friendly.find(params[:id])
  end
  
  private
  
  def remove_collaborators
   @wiki.users.destroy_all if params[:wiki][:private] == '0'
  end
  
  def wiki_params
    params.require(:wiki).permit(:name, :content, :private, :user_id, :user_ids => [])
  end
end
