class AnswersController < ApplicationController


   def answer_params
    params.require(:answer).permit(:answer, :question_id)
  end
end
