require 'rails_helper'


RSpec.describe SessionsController, type: :controller do
  include SessionsHelper
  context 'when password is invalid' do
    it 'renders the page with error' do
      user = FactoryGirl.create(:user)
      post :create, {:params=>{session: { email: user.email, password: 'invalid' }}}
      expect(response).to render_template(:new)
      expect(flash[:danger]).to match("Invalid email/password combination")
    end
  end

  context 'when password is valid remember checked' do
    it 'sets the user in the session and redirects to root url' do
      user = FactoryGirl.create(:user)
      post :create, {:params=>{session: { email: user.email, password: user.password, remember_me: 1 }}}
      expect(response).to redirect_to root_url
      expect(controller.current_user).to eq user
    end
  end

  context 'when password is valid' do
    it 'sets the user in the session and redirects to root url' do
      user = FactoryGirl.create(:user)
      user.save
      post :create, {:params=>{session: { email: user.email, password: user.password }}}
      user.activate
      #expect(user.activated).to true
      expect(response).to redirect_to root_url
      expect(current_user?(user)).to eq(true)
      user = User.find_by_email(user.email)
      user = user.to_json
      user = JSON.parse user
      expect(user["activated"]).to eq(true)
    end
  end

  context 'when session destroys' do
    it 'log out user when logged in' do
      get :destroy
      expect(response).to redirect_to root_url
    end
  end

  context 'when password is valid logout' do
    it 'sets the user in the session and redirects to root url' do
      user = FactoryGirl.create(:user)
      post :create, {:params=>{session: { email: user.email, password: user.password }}}
      expect(response).to redirect_to root_url
      expect(controller.current_user).to eq user
      log_in user
      get :destroy
      expect(response).to redirect_to root_url
    end
  end

end
