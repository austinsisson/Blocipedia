class UsersController < ApplicationController
  
  def show
    @user = current_user
    @wikis = policy_scope(Wiki)
  end
  
  def update
  end
  
  def refund_request_email
    @user = current_user
    UserMailer.refund_request(@user).deliver
    flash[:alert] = "Your refund request has been submitted! A member of our team will be in touch with you shortly!"
    redirect_to user_path(@user)
  end
end
