module CurrentCart
	extend ActiveSupport::Concern

	private

		# gets the :cart_id from the session object and attempts to find a cart with the corresponding ID
		def set_cart
			@cart = Cart.find(session[:cart_id])
		rescue ActiveRecord::RecordNotFound
			# if the cart is not found, it will make a new cart, store th ID of the created cart into the session and then return the new cart
			@cart = Cart.create
			session[:cart_id] = @cart.cart_id
		end
end