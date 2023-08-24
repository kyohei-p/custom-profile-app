class SkillsController < ApplicationController
  before_action :set_category_ids, only: [:edit, :new]

  def index
  end

  def create
    @category = Category.find(params[:category_id])
    @skill = @category.skills.build(skill_params)
    @skill.user = current_user

    if @skill.save
      @show_modal = true
      @modal_message = "#{@category.name}に#{@skill.name}を習得レベル#{@skill.skill_level}で追加しました!"
      redirect_to edit_category_skill_path(@category, @skill)
    else
      render :new
    end
  end

  def edit
    @category = Category.find(params[:category_id])
    @skill = Skill.with_deleted.find_by(id: params[:id])
    # @skill = Skill.find(params[:id])
    @categories = Category.all
    @skills = Skill.all

    render :edit
  end

  def new
    @category = Category.find(params[:category_id])
    @skill = @category.skills.build
  end

  def update
    puts params
    @category = Category.find(params[:category_id])
    @skill = Skill.find(params[:id])
    
    if @skill.update!(skill_params)
      render json: { success: true, message: "スキルの更新に成功しました", skill: @skill.attributes }
    else
      render json: { success: false, errors: @skill.errors.full_messages }
    end
  end

  def destroy
    @category = Category.find(params[:category_id])
    @skill = Skill.find(params[:id])
    if @skill.user_id == current_user.id
      @skill.destroy
    end
    redirect_to edit_category_skill_path(@category, @skill)
  end

  private

  def skill_params
    params.require(:skill).permit(:name, :skill_level)
  end

  def set_category_ids
    @category_ids = [1, 2, 3]
  end
end
