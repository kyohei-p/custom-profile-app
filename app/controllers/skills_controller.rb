class SkillsController < ApplicationController
  before_action :set_category_ids, only: [:edit, :new]

  def index
    if user_signed_in?
      @categories = Category.all
      @skill = Skill.new
      render :edit
    else
      redirect_to new_user_session_path
    end
  end

  def create
    if user_signed_in?
      @category = Category.find(params[:category_id])
      @skill = @category.skills.build(skill_params)
      @skill.user = current_user

      if @skill.save
        category_name = @category.name
        skill_name = @skill.name
        skill_level = @skill.skill_level
        @newly_created_skill = @skill
        newly_created_skill_id = @newly_created_skill.id
        render json: { success: true, category_name: category_name, skill_name: skill_name, skill_level: skill_level, skill_id: newly_created_skill_id, category_id: @category.id }
      else
        render json: { success: false, errors: @skill.errors.full_messages }
      end
    else
      redirect_to new_user_session_path
    end
  end

  def edit
    if user_signed_in?
      @category = Category.find(params[:category_id])
      @skill = Skill.find(params[:id])
      @categories = Category.all
      @skills = Skill.all

      render :edit
    else
      redirect_to new_user_session_path
    end
  end

  def new
    if user_signed_in?
      @category = Category.find(params[:category_id])
      @skill = @category.skills.build
    else
      redirect_to new_user_session_path
    end
  end

  def update
    @skill = Skill.find(params[:skill_id])
    
    if @skill.update!({"skill_level"=> params[:skill_level]})
      skill_name = @skill.name
      skill_level = @skill.skill_level
      render json: { success: true, skill_name: skill_name, skill_level: skill_level }
    else
      @error_update_message = "保存に失敗しました。"
      render json: { success: false, message: @error_update_message, errors: @skill.errors.full_messages }
    end
  end

  def destroy
    @skill = Skill.find(params[:skill_id])
    if @skill.user_id == current_user.id
      @skill.destroy
      skill_name = @skill.name
      render json: { success: true,  skill_name: skill_name }
    else
      @error_delete_message = "削除に失敗しました。"
      render json: { success: false, message: @error_delete_message, errors: @skill.errors.full_messages }
    end
  end

  private

  def skill_params
    params.require(:skill).permit(:name, :skill_level)
  end

  def set_category_ids
    @category_ids = [1, 2, 3]
  end
end
