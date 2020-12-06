class UsersController < ApplicationController
  before_action :authorize, except: [:new, :create]
  before_action :correct_user?, only: [:edit, :update, :destroy]
  def index
    @users = User.all
  end
   def show
    @user = User.find(params[:id])
   end
  def new
    @user = User.new
end

def create
    @user = User.new(user_params)
    p '#########'
pp @user
    p '#########'
    if @user.save
      redirect_to @user, notice: "Usuário foi criado com sucesso!"
    else
      render action: :new
    end
end
def edit
  @user = User.find(params[:id])
end

def update
  @user = User.find(params[:id])
  if @user.update_attributes(user_params)
    redirect_to users_path
  else
    render action: :edit
  end
end

def destroy
  @user = User.find(params[:id])
  @user.destroy
  sign_out
  redirect_to root_path
end
private
def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
end
end
