require 'spec_helper'

describe "product_lists/show" do
  before(:each) do
    @product_list = assign(:product_list, stub_model(ProductList,
      :name => "Name",
      :description => "MyText",
      :price => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
    rendered.should match(/1/)
  end
end
