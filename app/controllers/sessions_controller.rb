class SessionsController < ApplicationController
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }

  def create
      @user = User.find_by_email(params[:email])

      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to '/tasks'
      else
        flash[:danger] = "Usuário ou senha inválidos!"
        redirect_to '/'
      end
    end

    def destroy
      session[:user_id] = nil
      redirect_to '/'
    end
end
