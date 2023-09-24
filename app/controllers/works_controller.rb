class WorksController < ApplicationController
  def index
    if user_signed_in?
      @works = Work.all
    end
  end

  def create
    if user_signed_in?
      @work = Work.new(work_params)

      if @work.save
        redirect_to works_path
      else
        render :new
      end
    end
  end

  private

  def work_params
    params.require(:work).permit(:title, :description, :website_url, :image)
  end
end
