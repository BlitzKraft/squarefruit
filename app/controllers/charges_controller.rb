class ChargesController < ApplicationController
	Stripe.api_key = "sk_test_DQ0J9xxr2hKTAvVyvdDmr1Ds"
	def new
	end
	
	def create
		#prod = Product.find(params[:id])
		# @amount is in cents
		@amount = @product.price * 100
		customer = Stripe::Customer.create(
			:email => params[:stripeEmail],
			:source => params[:stripeToken]
		)
		charge = Stripe::Charge.create(
			:customer => customer.id,
			:amount => @amount,
			:description => 
			:currency => 'usd'
		)

	rescue Stripe::CardError => e
		flash[:error] = e.message
		redirect_to new_charge_path
	end
end
