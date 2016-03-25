class ChargesController < ApplicationController
	def new
	end
	
	def create
		# @amount is in cents
		@amount = Product.find([:id]).price * 100
		customer = Stripe::Customer.create(
			:email => params[:stripeEmail],
			:source => params[:stripeToken]
		)
		charge = Stripe::Charge.create(
			:customer => customer.id,
			:amount => @amount,
			# TODO change this to part name
			:description => '3D print',
			:currency => 'usd'
		)

	rescue Stripe::CardError => e
		flash[:error] = e.message
		redirect_to new_charge_path
	end
end
