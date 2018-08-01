class AnswersController < ApplicationController
  def create
    @answer = Answer.new answer_params
    if @answer.save
      respond_to do |format|
        format.html{redirect_to book_review_rate_path @review.book, @review}
        format.js
      end
    else
      flash[:warning] = t ".unsucess"
    end
  end

  def destroy
    @answer = Answer.find_by id: params[:id]
    if @answer
      @answer.delete
    else
      flash[:warning] = "Can't find this answer for delete"
    end
  end

  private
  def answer_params
    params.require(:answer)
          .permit :content, :user_id, :question_id
  end
end
