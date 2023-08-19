class UsersController < ApplicationController
    before_action :authenticate_user!, only: [:show, :edit, :update, :destroy]
    before_action :check_login, except: [:show, :edit, :update, :destroy]

    def index
      @user = current_user
      @users = User.all
      @skills = Skill.all
    end

    def edit
      @user = current_user
    end

    def update
      @user = User.find(params[:id])
      if @user.update!(user_params)
        redirect_to root_path
      end
    end

    private

    def user_params
      params.require(:user).permit(:self_introduction)
    end

    def check_login
      unless user_signed_in?
        redirect_to new_user_session_path, alert: "ログインしてください"
      end
    end
end
