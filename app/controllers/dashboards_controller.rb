class DashboardsController < ApplicationController
before_action :authenticate_user!
  def show
  end

  def admin
    @questions = Question.all  
  end

  def standard
    @user = current_user
    @workouts = current_user.workouts.paginate(page: params[:page], per_page: 10)
  end

  private
end
