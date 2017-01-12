class UserAnswersController < ApplicationController

  def new
    # @question = Question.new
    @question = Question.order("RANDOM()").first
    @answers = @question.answers.all
    @user_answer = User_answer.new
  end

  def create
    @user_answer = User_answer.create(user_answer_params)
    @user_answer.create(:question_id => @question.id)
    if @question.valid?
      flash[:notice] = "Question created."
      redirect_to root_path
    else
      render :new, :status => :unprocessable_entity
    end
  end

 private

  def user_answer_params
    params.require(:user_answer).permit(:question_id, :answer_id, :user_id)
  end

end
