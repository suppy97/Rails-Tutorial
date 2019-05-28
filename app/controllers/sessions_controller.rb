class SessionsController < ApplicationController
  # include SessionsHelper

  def new

  end

  def create
    user = User.find_by(email: params[:session][:email])

    if user && user.authenticate(params[:session][:password])
      # Success
      log_in user
      redirect_to user
    else
      # Failure
      # flash[:denger]はTwitterのBootstrapで文字が赤いフラッシュができる
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end

  end

  # DELETE / logout
  def destroy
    log_out
    redirect_to root_url
  end

end
