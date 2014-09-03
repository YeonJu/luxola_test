class ProductList < ActiveRecord::Base
	validates :name, presence: true
	validates :name, length: { minimum: 3}
	validates :description, length: {minimum: 5}
	validates :price, numericality: {greater_than_or_equal_to: 0}
end
