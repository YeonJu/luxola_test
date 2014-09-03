require 'spec_helper'

describe "Deleting product lists" do 
	let!(:product_list) { ProductList.create(name: "item1", description: "This is item 1.", price: 10)}

	it "is successful when clicking the destroy link" do
		visit "/product_lists"

		within "#product_list_#{product_list.id}" do
			click_link "Destroy"
		end
		#####product_list.name
		expect(page).to_not have_content(product_list.name)
		expect(ProductList.count).to eq(0)
	end
end

