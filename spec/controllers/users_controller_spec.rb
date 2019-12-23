require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  context 'GET #index' do
    it "returns a success response" do
      get :index
      expect(response).to be_success
    end
  end

  context 'GET #new' do
    it "returns a success response" do
      get :new
      expect(response).to be_success
    end
  end

  context 'GET #search' do
    it "returns a success response" do
      get :search
      expect(response).to be_success
    end
  end

  context 'GET #search with params empty' do
    it "returns a success response" do
      get :search, {:params => {:search => ''}}
      response.should redirect_to root_url
    end
  end

  context 'GET #search with params' do
    it "returns a success response" do
      get :search, {:params => {:search => 'aaa'}}
      expect(response).to be_success
    end
  end

  context 'GET #details' do
    it "returns a success response" do
      get :details
      expect(response).to be_success
    end
  end

  context 'GET #details with params' do
    it "returns a success response" do
      get :details, {:params => {:id => 'aaa'}}
      expect(response).to be_success
    end
  end

  context 'GET #details with params with correct value' do
    it "returns a success response" do
      get :details, {:params => {:id => 1}}
      expect(response).to be_success
    end
  end


  context 'GET #details with params with wrong details value' do
    it "returns a success response" do
      get :details, {:params => {:id => 2}}
      expect(response).to be_success
    end
  end

  context 'GET #users' do
    it "returns a success response" do
      user_params = {:fname=> "a", :lname=>"a", :email=>"a", :password=>"asdf",
                                                 :password_confirmation=>"asdf"}
      post :create, {:params=>{:user=>user_params}}
      expect(response).to render_template(:new)
      expect(response).to have_http_status(:success)
    end
  end

  let!(:user_params) { user_params = { fname: "username#{rand(1000)}",
                                       lname: "lastname#{rand(1000)}",
                                       email: "user#{rand(1000)}@temp.com",
                                       password: "Password123",
                                       password_confirmation: "Password123"
  } }

  context "POST #create" do
    it "user created" do
      post :create, user: user_params
      expect(assigns(:user)).to be_persisted
      expect(flash[:info]).to be_present
      expect(flash[:info]).to match(/^Please check your email to activate your account./)
      response.should redirect_to root_url
    end
  end


end
