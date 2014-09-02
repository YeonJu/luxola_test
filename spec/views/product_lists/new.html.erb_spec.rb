require 'spec_helper'

describe "product_lists/new" do
  before(:each) do
    assign(:product_list, stub_model(ProductList,
      :name => "MyString",
      :description => "MyText",
      :price => 1
    ).as_new_record)
  end

  it "renders new product_list form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", product_lists_path, "post" do
      assert_select "input#product_list_name[name=?]", "product_list[name]"
      assert_select "textarea#product_list_description[name=?]", "product_list[description]"
      assert_select "input#product_list_price[name=?]", "product_list[price]"
    end
  end
end
