require 'rails_helper'

RSpec.describe AccountActivationsController, type: :controller do

  context 'account activation is valid' do
    it 'will check user activation is valid flow' do
      user = FactoryGirl.create(:user)
      puts "user.activation", user.activation_token, user.activation_digest, user.activated
      # log_in user
      post :edit,{:params=>{ email: user.email, password: "password123"}}
      # expect(response).to redirect_to root_url
      # expect(flash[:danger]).to match("Invalid activation link")
    end
  end

  context 'account activation is invalid' do
    it 'will check user activation is invalid flow' do
      user = FactoryGirl.create(:user)
      post :edit,{:params=>{ email: user.email}}
      expect(response).to redirect_to root_url
      expect(flash[:danger]).to match("Invalid activation link")
    end
  end


end
