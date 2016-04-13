class ChargesController < ApplicationController
	protect_from_forgery with: :null_session
	Stripe.api_key = ENV['stripe_key']
	def new
		@product = Product.find(params[:prod_id])
	end
	
	def create
		@product = Product.find(params[:prod_id])
		# @amount is in cents
		@amount = (@product.price * 100).to_i
		#customer = Stripe::Customer.create(
		#	:email => params[:stripeEmail],
		#	:source => params[:stripeToken]
		#)

		customer = Stripe::Customer.create(
			:source => params[:stripeToken]
		)
		charge = Stripe::Charge.create(
			#:customer => current_user.stripe_cus_id,
			:customer => customer.id,
			:amount => @amount,
			:description => @product.threeD_model_file_name,
			:currency => 'usd'
		)
	
	rescue Stripe::CardError => e
		flash[:error] = e.message
		redirect_to new_charge_path(:prod_id => @product.id)
	end

	#def show
	#end

	def save_card
		render '/charges/save_card.html'
		customer = Stripe::Customer.create(
			card: token,
			description: 'paying user',
			email: @user.email
		)
		save_stripe_customer_id(stripe_cus_id, customer.id)
	end
end
