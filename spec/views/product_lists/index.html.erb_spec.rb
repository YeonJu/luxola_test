require 'spec_helper'

describe "product_lists/index" do
  before(:each) do
    assign(:product_lists, [
      stub_model(ProductList,
        :name => "Name",
        :description => "MyText",
        :price => 1
      ),
      stub_model(ProductList,
        :name => "Name",
        :description => "MyText",
        :price => 1
      )
    ])
  end

  it "renders a list of product_lists" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
