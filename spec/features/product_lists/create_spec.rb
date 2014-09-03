require 'spec_helper'

describe "Creating product lists" do 

	def create_product_list(options={})
		options[:name] ||= "My product"
		options[:description] ||= "This is my product"
		options[:price] ||= 10

		visit "/product_lists"
		click_link "New Product list"
		expect(page).to have_content("New product_list")

		fill_in "Name", with: options[:title]
		fill_in "Description", with: options[:description]
		fill_in "Price", with: options[:price]
		click_button "Create Product list"
	end

	# spec1
	it "redirects to the product list index page on success" do
		create_product_list
		expect(page).to have_content("This is my product")
	end

	#spec2
	it "displays an error when the product list has no title" do
		expect(ProductList.count).to eq(0)

		create_product_list title: "" 

		expect(page).to have_content("error")
		expect(ProductList.count).to eq(0)

		visit "/product_lists"
		expect(page).to_not have_content("This is my product")
	end

	#spec3
	it "displays an error when the product list has a title less than 3 chars" do
		expect(ProductList.count).to eq(0)

		create_product_list title: "HI" 

		expect(page).to have_content("error")
		expect(ProductList.count).to eq(0)
		visit "/product_lists"
		expect(page).to_not have_content("This is my product")
	end

	#spec4
	it "displays an error when the product list has a description less than 5 chars" do
		expect(ProductList.count).to eq(0)

		create_product_list description: "HI"

		expect(page).to have_content("error")
		expect(ProductList.count).to eq(0)
		visit "/product_lists"
		expect(page).to_not have_content("This is my product")
	end

	#spec5
	it "displays an error when the product list has a non-integer value" do
		expect(ProductList.count).to eq(0)

		create_product_list price: "HI"

		expect(page).to have_content("error")
		expect(ProductList.count).to eq(0)

		visit "/product_lists"
		expect(page).to_not have_content("My Product")
	end

	#spec6
	it "displays an error when the product list has a negative integer value" do
		expect(ProductList.count).to eq(0)

		create_product_list price: -5

		expect(page).to have_content("error")
		expect(ProductList.count).to eq(0)

		visit "/product_lists"
		expect(page).to_not have_content("My Product")
	end

end