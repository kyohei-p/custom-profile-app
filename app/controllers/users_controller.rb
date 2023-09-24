class UsersController < ApplicationController
    before_action :authenticate_user!, only: [:show, :edit, :update, :destroy]
    before_action :check_login, except: [:show, :edit, :update, :destroy]

    def index
      if user_signed_in?
        @user = current_user
        @users = User.all
        @skills = Skill.all
        @categories = Category.all
        @data = {}

        @categories.each do |category|
          sskills = @user.skills.where(category_id: category.id)
          monthly_skill_levels = {
            "先々月" => @user.skills.where(updated_at: 2.months.ago.beginning_of_month).sum(:skill_level),
            "先月" => @user.skills.where(updated_at: 1.months.ago.beginning_of_month).sum(:skill_level),
            "今月" => @user.skills.where(updated_at: Time.current.beginning_of_month..Time.current.end_of_month).sum(:skill_level)
          }

          @data[category.name] = monthly_skill_levels
        end
        @works_images = Work.includes(:image_attachment).where.not(active_storage_attachments: { id: nil })
      else
        redirect_to new_user_session_path
      end
    end

    def show
      @user = current_user
      render :edit
    end

    def edit
      if user_signed_in?
        @user = current_user
      else
        redirect_to new_user_session_path
      end
    end

    def update
      @user = User.find(params[:id])
      puts params

      if params[:user][:image].nil?
        @user.image.purge
      end

      if @user.update(user_params)
        redirect_to root_path
      else
        @errors = @user.errors.full_messages
        render :edit, status: :unprocessable_entity
      end
    end

    private

    def user_params
      params.require(:user).permit(:self_introduction, :image)
    end

    def check_login
      unless user_signed_in?
        redirect_to new_user_session_path, alert: "ログインしてください"
      end
    end


end
