class Admin::QuestionsController < Admin::BaseController
  def index
    @questions = Question.all.page(params[:page])
                         .per Settings.admin.per_page
    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @question = Question.find_by id: params[:id]
    @is_success = @question.destroy
    respond_to do |format|
      format.js
    end
  end
end
