class Cart < ActiveRecord::Base
	# each line_item contains a reference to a cart_ID
	# dependent: :destroy, the existence of line items is dependednt on the existence of the cart
	has_many :line_items, dependent: :destroy

	def add_product(product_id)
		# find_by- streamlined version of the where() method. instead of returning an array, it returns an existing LineItem or nil
		current_item = line__items.find_by(product_id: product_id)
		if current_item
			current_item.quantity += 1
		else
			current_item = line_items.build(product_id: product_id)
		end
		current_item
	end
end
