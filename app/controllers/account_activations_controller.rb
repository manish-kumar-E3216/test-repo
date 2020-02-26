class AccountActivationsController < ApplicationController
  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      log_in user
      flash[:success] = t('views.accounts.activated')
      redirect_to root_url
    else
      flash[:danger] = t('views.accounts.invalid_activation_link')
      redirect_to root_url
    end
  end
end