class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers.all
  end

  def new
    @question = Question.new
    4.times { answer = @question.answers.build }
  end

  def create
    @question = Question.create(question_params)
    @question.answers.create(:question_id => @question.id)
    if @question.valid?
      flash[:notice] = "Question created."
      redirect_to root_path
    else
      render :new, :status => :unprocessable_entity
    end
  end

  def update
    if current_question.update_attributes(params.require(:question).permit(:question, :category, :correctanswer))
       flash[:notice] = "Question updated."
       redirect_to current_question
     else
       flash[:error] = "There was an error saving the question. Please try again."
       render :edit
     end
  end

 private

  helper_method :current_question

  def question_params
    params.require(:question).permit!
  end

  def current_question
    @current_question ||= Question.find(params[:id])
  end


end
