require 'spec_helper'

describe "product_lists/edit" do
  before(:each) do
    @product_list = assign(:product_list, stub_model(ProductList,
      :name => "MyString",
      :description => "MyText",
      :price => 1
    ))
  end

  it "renders the edit product_list form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", product_list_path(@product_list), "post" do
      assert_select "input#product_list_name[name=?]", "product_list[name]"
      assert_select "textarea#product_list_description[name=?]", "product_list[description]"
      assert_select "input#product_list_price[name=?]", "product_list[price]"
    end
  end
end
