class SkillsController < ApplicationController
  def edit
    @categories = Category.all
    @skills = Skill.all
  end
end
