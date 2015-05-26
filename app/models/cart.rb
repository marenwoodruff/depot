class Cart < ActiveRecord::Base
	# each line_item contains a reference to a cart_ID
	# dependent: :destroy, the existence of line items is dependednt on the existence of the cart
	has_many :line_items, dependent: :destroy
end
