class UsersController < ApplicationController
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }

  def index
  end

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Usuário criado com sucesso!"
      redirect_to '/tasks'
    else
      flash[:danger] = "Erro ao criar um novo usuário!"
      render :new
    end
  end

private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end
