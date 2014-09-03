require 'spec_helper'

describe "Editing product lists" do 
	let!(:product_list) { ProductList.create(name: "item1", description: "This is item 1.", price: 10)}

	def update_product_list(options={})

		visit "/product_lists"
		options[:name] ||= "New Name"
		options[:description] ||= "New description"
		options[:price] ||= 100
		###############options[]??
		product_list = options[:product_list]

		within "#product_list_#{product_list.id}" do
			click_link "Edit"
		end

		fill_in "Name", with: options[:name]
		fill_in "Description", with: options[:description]
		fill_in "Price", with: options[:price]
		click_button "Update Product list"
	end

	# spec1
	it "updates a product lsit successfully with correct information" do

		update_product_list product_list: product_list

		product_list.reload

		expect(page).to have_content("Product list was successfully updated")
		expect(product_list.name).to eq("New Name")
		expect(product_list.description).to eq("New description")
		expect(product_list.price).to eq(100)
	end

	# spec2
	it "displays an error with no name" do
		update_product_list product_list: product_list, name:""
		name = product_list.name
		product_list.reload
		expect(product_list.name).to eq(name)
		expect(page).to have_content("error")
	end

	# spec3
	it "displays an error with a too short name" do
		update_product_list product_list: product_list, name:"HI"
		expect(page).to have_content("error")
	end

	# spec4
	it "displays an error with too short description" do
		update_product_list product_list: product_list, description:"HI"
		expect(page).to have_content("error")
	end

	# spec5
	it "displays an error with negative price" do
		update_product_list product_list: product_list, price:-5
		expect(page).to have_content("error")
	end
end