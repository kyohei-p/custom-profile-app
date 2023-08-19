class UsersController < ApplicationController
    before_action :authenticate_user!, only: [:show, :edit, :update, :destroy]
    before_action :check_login, except: [:show, :edit, :update, :destroy]

    def index
      @user = current_user
      @skills = Skill.all 
    end

    def edit
      @user = current_user
    end

    private

    def check_login
      unless user_signed_in?
        redirect_to new_user_session_path, alert: "ログインしてください"
      end
    end
end
