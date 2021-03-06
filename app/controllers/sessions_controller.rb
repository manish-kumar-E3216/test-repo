class SessionsController < ApplicationController
  include SessionsHelper
  def new
  end

  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_to root_url
    else
      flash.now[:danger] = t('views.sessions.login_error')
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

end
