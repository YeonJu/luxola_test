class ProductList < ActiveRecord::Base
	validates :title, presence: true
	validates :title, length: { minimum: 3}
	validates :description, length: {minimum: 5}
end
