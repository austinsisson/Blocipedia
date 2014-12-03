class ChargesController < ApplicationController
  def create
    customer = Stripe::Customer.create(
      email:    current_user.email,
      card:     params[:stripeToken]
    )
    
    charge = Stripe::Charge.create(
      customer:     customer.id,
      amount:       15_00,
      description:  "Membership - #{current_user.email}",
      currency:     'usd'
      )
    
    current_user.update(role: 'premium')
    current_user.save
    
    flash[:success] = "Thank you, #{current_user.user_name}"
    redirect_to user_path(current_user)
    
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
  
  def new
    @stripe_btn_data = {
      key:             "#{ Rails.configuration.stripe[:publishable_key] }",
      description:     "Membership - #{current_user.email}",
      amount:          15_00
      }
  end
end
