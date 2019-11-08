class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :give_users_right_to_admin, only: [:index]
  before_action :only_create_user_when_none_signed_in, only: [:new, :create]
  
  def index
    @users = User.all
  end

  
  def show
  end

 
  def new
    @user = User.new
  end

  
  def edit
  end

  
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    
    def set_user
      @user = User.find(params[:id])
    end

   
    def user_params
      params.require(:user).permit(:usertype, :name, :email, :password, :password_confirmation)
    end

    def give_users_right_to_admin
      unless current_user && current_user.usertype == "admin"
        redirect_to tasks_path, notice: "only admin user can access this page"
      end
    end
    def only_create_user_when_none_signed_in
      if current_user
        redirect_to users_path,  notice: "you can't create user when signed in"
      end
    end
end
