require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe ProductListsController do

  # This should return the minimal set of attributes required to create a valid
  # ProductList. As you add validations to ProductList, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "name" => "MyString", "description" => "MyDesciption", "price" => 100} }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ProductListsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all product_lists as @product_lists" do
      product_list = ProductList.create! valid_attributes
      get :index, {}, valid_session
      assigns(:product_lists).should eq([product_list])
    end
  end

  describe "GET show" do
    it "assigns the requested product_list as @product_list" do
      product_list = ProductList.create! valid_attributes
      get :show, {:id => product_list.to_param}, valid_session
      assigns(:product_list).should eq(product_list)
    end
  end

  describe "GET new" do
    it "assigns a new product_list as @product_list" do
      get :new, {}, valid_session
      assigns(:product_list).should be_a_new(ProductList)
    end
  end

  describe "GET edit" do
    it "assigns the requested product_list as @product_list" do
      product_list = ProductList.create! valid_attributes
      get :edit, {:id => product_list.to_param}, valid_session
      assigns(:product_list).should eq(product_list)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new ProductList" do
        expect {
          post :create, {:product_list => valid_attributes}, valid_session
        }.to change(ProductList, :count).by(1)
      end

      it "assigns a newly created product_list as @product_list" do
        post :create, {:product_list => valid_attributes}, valid_session
        assigns(:product_list).should be_a(ProductList)
        assigns(:product_list).should be_persisted
      end

      it "redirects to the created product_list" do
        post :create, {:product_list => valid_attributes}, valid_session
        response.should redirect_to(ProductList.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved product_list as @product_list" do
        # Trigger the behavior that occurs when invalid params are submitted
        ProductList.any_instance.stub(:save).and_return(false)
        post :create, {:product_list => { "name" => "invalid value" }}, valid_session
        assigns(:product_list).should be_a_new(ProductList)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        ProductList.any_instance.stub(:save).and_return(false)
        post :create, {:product_list => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested product_list" do
        product_list = ProductList.create! valid_attributes
        # Assuming there are no other product_lists in the database, this
        # specifies that the ProductList created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        ProductList.any_instance.should_receive(:update).with({ "name" => "MyString" })
        put :update, {:id => product_list.to_param, :product_list => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested product_list as @product_list" do
        product_list = ProductList.create! valid_attributes
        put :update, {:id => product_list.to_param, :product_list => valid_attributes}, valid_session
        assigns(:product_list).should eq(product_list)
      end

      it "redirects to the product_list" do
        product_list = ProductList.create! valid_attributes
        put :update, {:id => product_list.to_param, :product_list => valid_attributes}, valid_session
        response.should redirect_to(product_list)
      end
    end

    describe "with invalid params" do
      it "assigns the product_list as @product_list" do
        product_list = ProductList.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        ProductList.any_instance.stub(:save).and_return(false)
        put :update, {:id => product_list.to_param, :product_list => { "name" => "invalid value" }}, valid_session
        assigns(:product_list).should eq(product_list)
      end

      it "re-renders the 'edit' template" do
        product_list = ProductList.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        ProductList.any_instance.stub(:save).and_return(false)
        put :update, {:id => product_list.to_param, :product_list => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested product_list" do
      product_list = ProductList.create! valid_attributes
      expect {
        delete :destroy, {:id => product_list.to_param}, valid_session
      }.to change(ProductList, :count).by(-1)
    end

    it "redirects to the product_lists list" do
      product_list = ProductList.create! valid_attributes
      delete :destroy, {:id => product_list.to_param}, valid_session
      response.should redirect_to(product_lists_url)
    end
  end

end
